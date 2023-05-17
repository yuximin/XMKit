//
//  UIImage+Gradient.swift
//  XMKit
//
//  Created by apple on 2023/5/17.
//

import Foundation
import UIKit

extension UIImage {
    public enum GradientDirection {
        /// 水平
        case horizontal
        /// 竖直
        case vertical
        /// 斜向上
        case obliqueUpward
        /// 斜向下
        case obliqueDownward
    }
    
    /// 纯色图片
    public static func imageWith(color: UIColor, size: CGSize) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.main.scale)
        color.set()
        
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        context.fill(CGRect(origin: .zero, size: size))
        
        guard let colorImage = UIGraphicsGetImageFromCurrentImageContext(),
              let pngData = UIImagePNGRepresentation(colorImage) else { return nil }
        UIGraphicsEndImageContext()
        return UIImage(data: pngData, scale: UIScreen.main.scale)
    }
    
    /// 渐变色图片
    public static func imageWith(colors: [UIColor], size: CGSize, direction: GradientDirection, cornerRadius: CGFloat = 0, corners: UIRectCorner = .allCorners, isOpaque: Bool = false) -> UIImage? {
        if colors.isEmpty {
            return nil
        }
        
        if colors.count == 1 {
            return imageWith(color: colors.first!, size: size)
        }
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRect(origin: .zero, size: size)
        gradientLayer.colors = colors.map({ $0.cgColor })
        gradientLayer.isOpaque = isOpaque
        switch direction {
        case .horizontal:
            gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
            gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        case .vertical:
            gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
            gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
        case .obliqueUpward:
            gradientLayer.startPoint = CGPoint(x: 0, y: 1)
            gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        case .obliqueDownward:
            gradientLayer.startPoint = CGPoint(x: 0, y: 0)
            gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        }

        if cornerRadius != 0 {
            let shapeLayer = CAShapeLayer()
            shapeLayer.frame = CGRect(origin: .zero, size: size)
            shapeLayer.path = UIBezierPath(roundedRect: CGRect(origin: .zero, size: size), byRoundingCorners: corners, cornerRadii: CGSize(width: cornerRadius, height: cornerRadius)).cgPath
            gradientLayer.mask = shapeLayer
        }
        
        UIGraphicsBeginImageContextWithOptions(size, gradientLayer.isOpaque, 0)
        if let context = UIGraphicsGetCurrentContext() {
            gradientLayer.render(in: context)
        }
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}
