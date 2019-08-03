//
//  UIView+Extensions.swift
//  CSUtils
//
//  Created by Chrystian Salgado on 03/08/19.
//

import Foundation

/// http://www.swiftdevcenter.com/uiview-round-specific-corners-only-swift/

public extension UIView {
    
    func round(corners: UIRectCorner, cornerRadius: Double) {
        
        let size = CGSize(width: cornerRadius, height: cornerRadius)
        let bezierPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: size)
        let shapeLayer = CAShapeLayer()
        shapeLayer.frame = self.bounds
        shapeLayer.path = bezierPath.cgPath
        self.layer.mask = shapeLayer
    }
}
