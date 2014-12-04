//
//  SampleTransition.swift
//  InteractiveTransitionSample
//
//  Created by A12893 on 2014/12/04.
//  Copyright (c) 2014年 Ameba Studio. All rights reserved.
//

import UIKit

private let TransitionThreadhold: CGFloat = 0.5

class TransitionManager: UIPercentDrivenInteractiveTransition, UIViewControllerAnimatedTransitioning, UIViewControllerTransitioningDelegate {
    var sourceViewController: UIViewController! {
        didSet {
            let gesture = UIPanGestureRecognizer(target: self, action: "gestureHandler:")
            sourceViewController.view.addGestureRecognizer(gesture)
        }
    }
    var destinationViewController: UIViewController! {
        didSet {
            destinationViewController.transitioningDelegate = self
            destinationViewController.modalPresentationStyle = .Custom
        }
    }
    
    // MARK: UIPanGestureRecognizer delegate
    func gestureHandler(recognizer: UIPanGestureRecognizer) {
        let translation = recognizer.translationInView(recognizer.view!)
        let percentage =  translation.x / CGRectGetWidth(recognizer.view!.bounds)

        switch recognizer.state {
        case UIGestureRecognizerState.Began:
            sourceViewController.presentViewController(destinationViewController, animated:true, completion:nil)
        case UIGestureRecognizerState.Changed:
            updateInteractiveTransition(percentage)
        default:
            if percentage > TransitionThreadhold {
                finishInteractiveTransition()
            } else {
                cancelInteractiveTransition()
            }
            break
        }
    }
    
    // MARK: UIViewControllerTransitioningDelegate protocol
    func interactionControllerForPresentation(animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return self
    }
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }
    
    // MARK: UIViewControllerAnimatedTransitioning protocol
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval { return 1 }
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let sourceViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey) as SourceViewController
        let destinationViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey) as DestinationViewController
        
        let containerView = transitionContext.containerView()
        let frame = transitionContext.initialFrameForViewController(sourceViewController)
        
        containerView.addSubview(destinationViewController.view)
        destinationViewController.view.frame = CGRectMake(-frame.size.width, frame.origin.y, frame.size.width, frame.size.height)
        
        UIView.animateWithDuration(1, animations: {
            destinationViewController.view.frame = frame
        }, completion: { completed in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
        })
    }
}
