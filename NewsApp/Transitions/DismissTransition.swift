//
//  DismissTransition.swift
//  NewsApp
//
//  Created by Sana Kavser  on 22/10/22.
//

import Foundation
import UIKit

class DismissTransition: NSObject, UIViewControllerAnimatedTransitioning {
    
    var animator: UIViewImplicitlyAnimating?
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let animator = self.interruptibleAnimator(using: transitionContext)
        animator.startAnimation()
    }
    
    func interruptibleAnimator(using transitionContext: UIViewControllerContextTransitioning) -> UIViewImplicitlyAnimating {
        if self.animator != nil {
            return self.animator!
        }
        
        let fromViewController = transitionContext.viewController(forKey: .from) ?? UIViewController()
        
        let fromView = fromViewController.view ?? UIView()
        
        
        let animator = UIViewPropertyAnimator(duration: self.transitionDuration(using: transitionContext), curve: .easeInOut) {
            
            fromView.frame = CGRect(x: fromView.frame.origin.x, y:fromView.frame.origin.y, width: fromView.frame.height, height: fromView.frame.width)
        }
        
        animator.addCompletion { _ in
            transitionContext.completeTransition(true)
        }
        
        self.animator = animator
        
        return animator
        
    }
    
    func animationEnded(_ transitionCompleted: Bool) {
        self.animator = nil
    }
}
