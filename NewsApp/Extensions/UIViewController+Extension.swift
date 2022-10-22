//
//  UIViewController+Extension.swift
//  NewsApp
//
//  Created by Sana Kavser  on 22/10/22.
//

import Foundation
import UIKit
extension UIViewController: UIViewControllerTransitioningDelegate {

    public func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return PresentTransition()
    }

    public func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return DismissTransition()
    }
}
