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

    func configureView() {
        // Update the user interface for the detail item.
        if let detail = detailItem {
            if let name = nameLabel {
                name.text = detail.name
            }
            if let magnitude = magnitudeLabel {
                magnitude.text = "\(detail.splashMagnitude!)kS"
            }
            if let radius = radiusLabel {
                radius.text = "\(detail.splashRadius!)m"
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var detailItem: Magikarp? {
        didSet {
            // Update the view.
            configureView()
        }
    }


}

