//
//  UIViewController+Extension.swift
//  XMKit
//
//  Created by apple on 2024/4/3.
//

import UIKit

public extension UIViewController {
    
    var navigationBarHeight: CGFloat {
        self.navigationController?.navigationBar.frame.height ?? 44
    }
    
    var tabBarHeight: CGFloat {
        self.tabBarController?.tabBar.frame.height ?? 49
    }
}
