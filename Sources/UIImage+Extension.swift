//
//  UIImage+Extension.swift
//  XMKit
//
//  Created by apple on 2024/4/5.
//

import Foundation

public extension UIImage {
    func resized(to size: CGSize) -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: size)
        return renderer.image { (context) in
            self.draw(in: CGRect(origin: .zero, size: size))
        }
    }
}
