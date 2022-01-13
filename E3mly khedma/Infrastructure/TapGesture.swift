//
//  TapGesture.swift
//  E3mly khedma
//
//  Created by Ahmed Ashraf on 11/01/2022.
//

import UIKit


struct AssociatedKeys {
static var actionState: UInt8 = 0
}

typealias ActionTap = () -> Void

extension UIView {

var addAction: ActionTap? {
    get {
        guard let value = objc_getAssociatedObject(self, &AssociatedKeys.actionState) as? ActionTap else {
            return nil
        }
        return value
    }
    set {
        objc_setAssociatedObject(self, &AssociatedKeys.actionState, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        self.tapWithAnimation()
    }
}

func tapWithAnimation() {
    self.gestureRecognizers?.removeAll()
    let longTap = UILongPressGestureRecognizer(target: self, action: #selector(viewLongTap(_:)))
    longTap.minimumPressDuration = 0.035
    longTap.delaysTouchesBegan = true
    self.addGestureRecognizer(longTap)
}

@objc
func viewLongTap(_ gesture: UILongPressGestureRecognizer) {
    if gesture.state != .ended {
        animateView(alpha: 0.3)
        return
    } else if gesture.state == .ended {
        let touchLocation = gesture.location(in: self)
        if self.bounds.contains(touchLocation) {
            animateView(alpha: 1)
            addAction?()
            return
        }
    }
    animateView(alpha: 1)
}

fileprivate func animateView(alpha: CGFloat) {
    UIView.transition(with: self, duration: 0.3,
                      options: .transitionCrossDissolve, animations: {
                        self.subviews.forEach { subView in
                            subView.alpha = alpha
                        }
    })
}
}
