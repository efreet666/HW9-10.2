//
//  Model.swift
//  HW9-10.2
//
//  Created by Влад Бокин on 29.08.2021.
//

import Foundation
import UIKit

struct Pizza {
    var name: String
    var coast: Double
    var image: UIImage?
    
    init(name: String, coast: Double, image: UIImage?) {
        self.name = name
        self.coast = coast
        self.image = image
    }
}
