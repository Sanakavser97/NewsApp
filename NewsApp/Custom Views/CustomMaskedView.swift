//
//  CustomMaskedView.swift
//  NewsApp
//
//  Created by Sana Kavser  on 21/10/22.
//

import Foundation
import UIKit

class CustomMaskedView: UIView {
    
    var customLayers: [CAShapeLayer]?
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    override func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: layer)
        self.shadowMasked(corners: [.bottomLeft, .topRight], color: UIColor.systemOrange, positionRight: false)
    }
}

class CustomReverseMaskedView: UIView {
    var customLayers: [CAShapeLayer]?
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    override func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: layer)
        self.shadowMasked(corners: [.topLeft, .bottomRight, .bottomLeft], color: AppUIColor.blueTeal.value, positionRight: true)
    }

}


class CustomNotRightBottomMaskedView: UIView {
    var customLayers: [CAShapeLayer]?
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    override func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: layer)
        self.shadowMasked(corners: [.topLeft, .topRight, .bottomLeft], color: AppUIColor.lightOrange.value, positionRight: false)
        
    }

}


class CustomNotLeftTopMaskedView: UIView {
    var customLayers: [CAShapeLayer]?
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    override func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: layer)
        self.shadowMasked(corners: [.topRight, .bottomRight, .bottomLeft], color: AppUIColor.blueTeal.value, positionRight: true)
    }

}


