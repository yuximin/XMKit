//
//  UIView+Extension.swift
//  XMKit
//
//  Created by apple on 2024/8/6.
//

import UIKit

extension UIView {
    public static var isRTL: Bool {
        UIView.userInterfaceLayoutDirection(for: UIView.appearance().semanticContentAttribute) == .rightToLeft
    }
}
