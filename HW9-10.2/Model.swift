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
    var images: [UIImage?]
    
    init(name: String, coast: Double, images: [UIImage?]) {
        self.name = name
        self.coast = coast
        self.images = images
    }
}
