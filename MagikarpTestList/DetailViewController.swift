//
//  DetailViewController.swift
//  MagikarpTestList
//
//  Created by Dean Mollica on 27/7/17.
//  Copyright © 2017 Dean Mollica. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var magnitudeLabel: UILabel!
    @IBOutlet weak var radiusLabel: UILabel!
    @IBOutlet weak var splashButton: UIButton!

    var detailItem: Magikarp? {
        didSet {
            // Update the view.
            configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let detail = detailItem {
            nameLabel?.text = detail.name!
            splashButton?.setTitle("\(detail.name!), use Splash Attack!", for: .normal)
            magnitudeLabel?.text = "\(detail.splashMagnitude!)kS"
            radiusLabel?.text = "\(detail.splashRadius!)m"
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }

    @IBAction func useSplash(_ sender: Any) {
        if let detail = detailItem {
            let ac = UIAlertController(title: "Go, \(detail.name!)!", message: detail.useSplashAttack(), preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        }
    }

}

