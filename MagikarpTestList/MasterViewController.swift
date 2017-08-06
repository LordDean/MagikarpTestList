//
//  MasterViewController.swift
//  MagikarpTestList
//
//  Created by Dean Mollica on 27/7/17.
//  Copyright © 2017 Dean Mollica. All rights reserved.
//

import UIKit

protocol MagikarpModalDelegate {
    func chosenImage(imageString: String)
}

class MasterViewController: UITableViewController, MagikarpModalDelegate {

    var detailViewController: DetailViewController? = nil
    var objects = [Magikarp]()
    
    var currentName: String?
    var currentMagnitude: Int?
    var currentRadius: Int?
    var currentImage: String?


    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = editButtonItem
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(insertNewObject))
        title = "Magikarp List"

    }

    override func viewWillAppear(_ animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }
    
    func chosenImage(imageString: String) {
        currentImage = imageString
        createMagikarp()
    }

    func insertNewObject() {
        let ac = UIAlertController(title: "Magikarp Attributes", message: "Enter the details for your Magikarp", preferredStyle: .alert)
        ac.addTextField() { textField in
            textField.placeholder = "Name"
        }
        ac.addTextField() { textField in
            textField.placeholder = "Splash Magnitude (kilosplashes)"
            textField.keyboardType = .numberPad
        }
        ac.addTextField() { textField in
            textField.placeholder = "Splash Radius (metres)"
            textField.keyboardType = .numberPad
        }
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        ac.addAction(UIAlertAction(title: "OK", style: .default) { [unowned self, ac] _ in
            if ac.textFields![0].text?.isEmpty ?? true {
                self.currentName = nil
            } else {
                self.currentName = ac.textFields![0].text!
            }
            if ac.textFields![1].text?.isEmpty ?? true {
                self.currentMagnitude = nil
            } else {
                self.currentMagnitude = Int(ac.textFields![1].text!)!
            }
            if ac.textFields![2].text?.isEmpty ?? true {
                self.currentRadius = nil
            } else {
                self.currentRadius = Int(ac.textFields![2].text!)!
            }
            self.performSegue(withIdentifier: "chooseImage", sender: nil)
        })
        self.present(ac, animated: true)
    }
    
    func createMagikarp() {
        if currentName == nil || currentRadius == nil || currentMagnitude == nil || currentImage == nil {
            let ac = UIAlertController(title: "Cancelled", message: "Did not create Magikarp", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        } else {
            objects.append(Magikarp(name: currentName!, magnitude: currentMagnitude!, radius: currentRadius!, image: currentImage!))
            tableView.reloadData()
        }
    }

    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let object = objects[indexPath.row]
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                controller.detailItem = object
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        } else if segue.identifier == "chooseImage" {
            let controller = (segue.destination as! UINavigationController).topViewController as! ImageViewController
            controller.delegate = self
        }
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let object = objects[indexPath.row]
        cell.textLabel!.text = object.name
        return cell
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            objects.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }


}

