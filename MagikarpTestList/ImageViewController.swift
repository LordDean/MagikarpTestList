//
//  ImageViewControllerCollectionViewController.swift
//  MagikarpTestList
//
//  Created by Dean Mollica on 6/8/17.
//  Copyright © 2017 Dean Mollica. All rights reserved.
//

import UIKit

private let reuseIdentifier = "KarpImg"

class ImageViewController: UICollectionViewController {
    var delegate: MagikarpModalDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelView))
        self.title = "Choose Pattern"

        // Do any additional setup after loading the view.
    }
    
    func cancelView() {
        if let delegate = self.delegate {
            delegate.cancelChoosingImage()
        }
        dismiss(animated: true, completion: nil)
    }
    
    func magikarpPatternFor(number: Int) -> String {
        if number > 0 && number < 28 {
            return "\(number)"
        } else {
            return "99"
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource
    /*
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    */

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 29
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MagikarpCell
    
        // Configure the cell
        let imageNumber = indexPath.item + 1
        cell.imageView.image = UIImage(named: magikarpPatternFor(number: imageNumber))

        return cell
    }

    // MARK: UICollectionViewDelegate
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let delegate = self.delegate {
            delegate.chosenImage(imageString: magikarpPatternFor(number: indexPath.item + 1))
        }
        dismiss(animated: true)
    }
 
    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
