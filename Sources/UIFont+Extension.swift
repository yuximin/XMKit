//
//  UIFont+Extension.swift
//  XMKit
//
//  Created by apple on 2024/4/3.
//

import UIKit

public extension String {
    
    var font: UIFont { font(weight: .regular) }
    
    func font(weight: UIFont.Weight = .regular) -> UIFont {
        UIFont.systemFont(ofSize: Double(self) ?? 12, weight: weight)
    }
}

public extension Int {
    
    var font: UIFont { font(weight: .regular) }
    
    func font(weight: UIFont.Weight = .regular) -> UIFont {
        UIFont.systemFont(ofSize: Double(self), weight: weight)
    }
}

public extension CGFloat {
    
    var font: UIFont { font(weight: .regular) }
    
    func font(weight: UIFont.Weight = .regular) -> UIFont {
        UIFont.systemFont(ofSize: self, weight: weight)
    }
}

public extension Double {
    
    var font: UIFont { font(weight: .regular) }
    
    func font(weight: UIFont.Weight = .regular) -> UIFont {
        UIFont.systemFont(ofSize: self, weight: weight)
    }
}
