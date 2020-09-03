//
//  NavViewController.swift
//  U17Test
//
//  Created by hjun on 2020/9/2.
//  Copyright © 2020 hjun. All rights reserved.
//

import UIKit

class NavViewController: UINavigationController, UIGestureRecognizerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    func setupLayout() {
        guard let interactionGes = interactivePopGestureRecognizer
            else {return}
        guard let targetView = interactionGes.view else {return}
        guard let internalTargets = interactionGes.value(forKeyPath: "targets") as? [AnyObject] else {
            return
        }
        guard let internalTarget = internalTargets.first?.value(forKey: "target") else {
            return
        }
        let action = Selector(("handleNavigationTransition:"))
        let fullScreenGes = UIPanGestureRecognizer(target: internalTarget, action: action)
        fullScreenGes.delegate = self
        targetView.addGestureRecognizer(fullScreenGes)
        interactionGes.isEnabled = false
        
    }
    //push 隐藏导航栏
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if  viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: true)
    }
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        let isLeftToRight = UIApplication.shared.userInterfaceLayoutDirection == .leftToRight
        guard let ges = gestureRecognizer as? UIPanGestureRecognizer else {
            return true
        }
        if ges.translation(in: gestureRecognizer.view).x * (isLeftToRight ? 1 : -1) <= 0 || disablePopGesture {
            return false
        }
        return viewControllers.count != 1
    }
}
extension NavViewController {
    override var preferredStatusBarStyle: UIStatusBarStyle{
        guard let topVC = topViewController  else {
            return .lightContent
        }
        return topVC.preferredStatusBarStyle
    }
}
enum NavigationBarStyle {
    case theme
    case clear
    case white
}
extension UINavigationController {
    private struct AssocitedKeys {
        static var disablePopGesture: Void?
    }
    var disablePopGesture : Bool {
        get {
            return objc_getAssociatedObject(self, &AssocitedKeys.disablePopGesture) as? Bool ?? false
        }
        set {
            objc_setAssociatedObject(self, &AssocitedKeys.disablePopGesture,newValue,.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    func barStyle(_ style:NavigationBarStyle) {
        switch style {
        case .theme:
            
            navigationBar.barStyle = .black
            navigationBar.setBackgroundImage(UIImage(named: "nav_bg"), for: .default)
            navigationBar.shadowImage = UIImage()
            navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black,
                                                 NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18)]
        case .clear:
            navigationBar.barStyle = .black
            navigationBar.setBackgroundImage(UIImage(), for: .default)
            navigationBar.shadowImage = UIImage()
            navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white,
                                                 NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18)]
        case .white:
            navigationBar.barStyle = .default
            navigationBar.setBackgroundImage(UIColor.white.image(), for: .default)
            navigationBar.shadowImage = nil
            navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black,
                                                 NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18)]
        }
    }
    
    
}
