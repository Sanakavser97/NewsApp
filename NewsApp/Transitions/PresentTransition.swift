//
//  PresentTransition.swift
//  NewsApp
//
//  Created by Sana Kavser  on 22/10/22.
//

import Foundation
import UIKit

class PresentTransition: NSObject, UIViewControllerAnimatedTransitioning {
    
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

        let container = transitionContext.containerView
        
        let fromViewController = transitionContext.viewController(forKey: .from) ?? UIViewController()
        
        let fromView = fromViewController.view ?? UIView()
        let toViewController = transitionContext.viewController(forKey: .to) ?? UIViewController()
        let toView = toViewController.view ?? UIView()
        
        toView.frame = fromView.frame
        toView.setCenterOfRotation()
        toView.transform = CGAffineTransform(rotationAngle: .pi/2)
        
        container.addSubview(toView)
        

        let animator = UIViewPropertyAnimator(duration: self.transitionDuration(using: transitionContext), curve: .easeInOut) {

            toView.transform = CGAffineTransform(rotationAngle: 0)
            
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
