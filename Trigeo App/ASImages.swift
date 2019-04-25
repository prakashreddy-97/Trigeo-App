//
//  ASImages.swift
//  AirShare
//
//  Created by Apple on 17/04/19.
//  Copyright © 2019 OngoFramework. All rights reserved.
//

import Foundation
import UIKit

struct ASImages {
    static let EyeIcon = UIImage(named: "EyeIcon")
    static let EyeCancelIcon = UIImage(named: "EyeCancelIcon")
}

struct ASColors {
    static let appBlueColor = UIColor(named: "BlueColor")!
    static let ColorDarkGrey = UIColor(named: "ColorDarkGrey")!
    static let appColor = UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0)
    static let blueappColor =  UIColor(named: "profileViewColor")!
    static let profileViewColor =  blueappColor
    static let profileViewBorderColor = UIColor(named: "profileViewBorderColor")!
    static let textfieldTextColor = ColorDarkGrey
    static let provAuth = UIColor(named: "prov.Auth")!
    static let Approved = UIColor(named: "Approved")!
    static let pending = UIColor(named: "pending")!
    
}

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int,opacity: CGFloat = 1.0) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: opacity)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}
