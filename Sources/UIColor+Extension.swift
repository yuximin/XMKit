//
//  UIColor+Extension.swift
//  XMKit
//
//  Created by apple on 2024/4/3.
//

import Foundation

public extension UIColor {
    
    /// 十六进制字符串转 `UIColor`
    convenience init(hexString: String, alpha: CGFloat = 1) {
        let valueString = hexString.lowercased()
            .replacingOccurrences(of: "0x", with: "")
            .replacingOccurrences(of: "#", with: "")
        
        guard let hexValue = Int(valueString, radix: 16) else {
            self.init(red: 0, green: 0, blue: 0, alpha: 1)
            return
        }
        
        let red = (hexValue >> 16) & 0xFF
        let green = (hexValue >> 8) & 0xFF
        let blue = hexValue & 0xFF
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: alpha)
    }
    
    /// 十六进制数值转 `UIColor`
    convenience init(hex: Int, alpha: CGFloat = 1) {
        let hexString = String(format: "%06X", hex)
        self.init(hexString: hexString, alpha: alpha)
    }
    
    static var random: UIColor {
        UIColor.init(red: CGFloat(arc4random() % 255) / 255.0, green: CGFloat(arc4random() % 255) / 255.0, blue: CGFloat(arc4random() % 255) / 255.0, alpha: 1)
    }
}

public extension String {
    
    var color: UIColor { UIColor(hexString: self) }
}

public extension Int {
    
    var color: UIColor { UIColor(hex: self) }
}
