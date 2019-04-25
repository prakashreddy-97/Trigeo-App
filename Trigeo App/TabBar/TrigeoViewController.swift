//
//  TrigeoViewController.swift
//  Trigeo App
//
//  Created by Mahesh on 20/04/19.
//  Copyright © 2019 student. All rights reserved.
//

import UIKit

class TrigeoViewController: UITabBarController {
    @IBInspectable var indicatorColor: UIColor = ASColors.appBlueColor
    @IBInspectable var onTopIndicator: Bool = true

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.tintColor = ASColors.blueappColor
        // Do any additional setup after loading the view.
        
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        // Draw Indicator above the tab bar items
        guard let numberOfTabs = tabBar.items?.count else {
            return
        }
        let numberOfTabsFloat = CGFloat(numberOfTabs)
        let imageSize = CGSize(width: tabBar.frame.width / numberOfTabsFloat,
                               height: tabBar.frame.height)
        let indicatorImage = UIImage.drawTabBarIndicator(color: indicatorColor,
                                                         size: imageSize ,
                                                         onTop: onTopIndicator)
        self.tabBar.selectionIndicatorImage = indicatorImage
       
    }

}

extension UIImage{
    //Draws the top indicator by making image with filling color
    class func drawTabBarIndicator(color: UIColor, size: CGSize, onTop: Bool) -> UIImage {
        let indicatorHeight = size.height / 15
        let yPosition = onTop ? 0 : (size.height - indicatorHeight)
        
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(CGRect(x: 20, y: yPosition, width: size.width - 35, height: indicatorHeight))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image!
    }
}

class CustomTabBar : UITabBar {
    
    @IBInspectable var height: CGFloat = 0.0
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        var sizeThatFits = super.sizeThatFits(size)
        if height > 0.0 {
            sizeThatFits.height = height
        }
        return sizeThatFits
    }
}
