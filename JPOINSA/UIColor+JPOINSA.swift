//
//  UIColor+JPOINSA.swift
//  JPOINSA
//
//  Created by Gautier Delorme on 26/01/16.
//  Copyright © 2016 gautierdelorme. All rights reserved.
//

import UIKit

extension UIColor {
    
    // JPOINSA Colors
    
    class func insaRed() -> UIColor {
        return UIColor.colorWithHexa("#E6271A")
    }
    
    class func insaBlack() -> UIColor {
        return UIColor.colorWithHexa("#5E6061")
    }
    
    // MARK: - Colors Tools
    
    //takes #123456
    class func colorWithHexa(hexa: String) -> UIColor {
        let cHexa = hexa.substringFromIndex(hexa.startIndex.advancedBy(1)).cStringUsingEncoding(NSASCIIStringEncoding)
        let x = strtol(cHexa!, nil, 16)
        return UIColor.colorWithHexaInt(x)
    }
    
    //takes 0x123456
    private class func colorWithHexaInt(hexa:Int) -> UIColor {
        return UIColor(red: (hexa >> 16) & 0xFF, green: (hexa >> 8) & 0xFF, blue: hexa & 0xFF)
    }
    
    private convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
}
