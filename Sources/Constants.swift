//
//  Constants.swift
//  XMKit
//
//  Created by apple on 2024/4/3.
//

import Foundation

/// 获取当前 keyWindow
public var xKeyWindow: UIWindow? {
    if #available(iOS 15, *) {
        return UIApplication.shared.connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .filter { $0.activationState == .foregroundActive }
            .flatMap { $0.windows }
            .first { $0.isKeyWindow }
    }
    
    if #available(iOS 13, *) {
        return UIApplication.shared.windows.first { $0.isKeyWindow }
    }
    
    return UIApplication.shared.keyWindow
}

/// 屏幕尺寸
public var xScreenSize: CGSize { UIScreen.main.bounds.size }

/// 屏幕宽度
public var xScreenWidth: CGFloat { xScreenSize.width }

/// 屏幕高度
public var xScreenHeight: CGFloat { xScreenSize.height }

/// 状态栏高度
public var xStatusBarHeight: CGFloat {
    if #available(iOS 13.0, *) {
        return xKeyWindow?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
    } else {
        return UIApplication.shared.statusBarFrame.height
    }
}

/// 导航栏高度
public var xNavigationBarHeight: CGFloat { 44 }

/// TabBar 高度
public var xTabBarHeight: CGFloat { 49 }

/// 安全区域边距
public var xSafeAreaInsets: UIEdgeInsets { xKeyWindow?.safeAreaInsets ?? .zero }

/// 安全区域底部高度
public var xSafeAreaTopHeight: CGFloat { xSafeAreaInsets.top }

/// 安全区域底部高度
public var xSafeAreaBottomHeight: CGFloat { xSafeAreaInsets.bottom }

/// 状态栏高度 + 导航栏高度
public var xTopBarHeight: CGFloat { xStatusBarHeight + xNavigationBarHeight }

/// TabBar 高度 + 安全区域底部边距
public var xBottomBarHeight: CGFloat { xTabBarHeight + xSafeAreaInsets.bottom }

/// App 版本
public var xAppVersion: String? { Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String }

/// Build Number
public var xBuildNumber: String? { Bundle.main.infoDictionary?["CFBundleVersion"] as? String }

/// 是否是深色模式
public var xIsDarkMode: Bool {
    if #available(iOS 12.0, *) {
        let userInterfaceStyle = UIScreen.main.traitCollection.userInterfaceStyle
        return userInterfaceStyle == .dark
    }
    return false
}
