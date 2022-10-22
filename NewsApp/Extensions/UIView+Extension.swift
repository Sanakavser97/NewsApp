//
//  UIView+Extension.swift
//  NewsApp
//
//  Created by Sana Kavser  on 21/10/22.
//

import Foundation
import UIKit

extension UIView {
    
    func shadowMasked(corners: UIRectCorner, color: UIColor, positionRight: Bool){
        let corners:UIRectCorner = corners
        var roundRect = CGRect()
        if positionRight {
            roundRect = CGRect(x: self.bounds.width * 0.25, y: self.bounds.origin.x, width: self.bounds.width * 0.75, height: self.bounds.height)
        } else {
            roundRect = CGRect(x: self.bounds.origin.x, y: self.bounds.origin.x, width: self.bounds.width * 0.75, height: self.bounds.height)
        }
        let path = UIBezierPath(roundedRect: roundRect, byRoundingCorners: corners, cornerRadii: CGSize(width: 20, height: 20))
        let mask = CAShapeLayer()

        mask.path = path.cgPath
        mask.fillColor = color.cgColor

        let shadowLayer = CAShapeLayer()
        shadowLayer.shadowColor = UIColor.black.cgColor
        shadowLayer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        shadowLayer.shadowRadius = 4.0
        shadowLayer.shadowOpacity = 0.6
        shadowLayer.shadowPath = mask.path
        
        guard let sublayers = self.layer.sublayers else { self.layer.insertSublayer(shadowLayer, at: 0)
            self.layer.insertSublayer(mask, at: 1)
            return
        }
        
        for sublayer in sublayers where sublayer.isKind(of: CAShapeLayer.self) {
            sublayer.removeFromSuperlayer()
        }
        self.layer.insertSublayer(shadowLayer, at: 0)
        self.layer.insertSublayer(mask, at: 1)
    }
    
    func setCustomShadow(cornerRadius: CGFloat, shadowOpacity: Float, offset: CGSize, shadowRadius: CGFloat){
        layer.shadowColor = UIColor.black.cgColor
        layer.cornerRadius = cornerRadius
        layer.shadowOpacity = shadowOpacity
        layer.shadowOffset = offset
        layer.shadowRadius = shadowRadius
    }
    
    
    func showLoader() {
            let blurLoader = LoaderView(frame: frame)
            self.addSubview(blurLoader)
        }

        func removeLoader() {
            if let blurLoader = subviews.first(where: { $0 is LoaderView }) {
                blurLoader.removeFromSuperview()
            }
        }
}
