//
//  Magikarp.swift
//  MagikarpTestList
//
//  Created by Dean Mollica on 27/7/17.
//  Copyright © 2017 Dean Mollica. All rights reserved.
//

import UIKit

class Magikarp: NSObject {
    
    let splashMagnitude: Int!
    let splashRadius: Int!
    let name: String!
    
    init(name: String, magnitude: Int, radius: Int) {
        self.splashMagnitude = magnitude
        self.splashRadius = radius
        self.name = name
    }
    
    func useSplashAttack() {
        print("The Magikarp \(self.name!) used Splash Attack! It had a radius of \(self.splashRadius!)m and a magnitude of \(splashMagnitude!)kS (kilosplashes)!")
    }
    
}
