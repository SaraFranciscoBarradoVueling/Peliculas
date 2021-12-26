//
//  RouterInterface.swift
//  Peliculas
//
//  Created by Sara Francisco on 26/12/21.
//

import UIKit

// MARK: - Base Router Interface
protocol RouterInterface: class {
    
    var navigationController: UINavigationController? { get set }
    var viewController: UIViewController? { get set }
    
    init()
    
    func instantiateViewController<T>(_ context: T?) -> UIViewController
}


// MARK: - Base Router Interface Default Implementation
extension RouterInterface {
    
    init(navigationController: UINavigationController? = nil) {
        self.init()
        self.navigationController = navigationController
    }
    
    // MARK: - Push -
    func pushOnNavigationController(animation anim: Bool) {
        navigationController?.pushViewController(instantiateViewController(nil as String?), animated: anim)
    }
    
    func pushOnNavigationController<T>(_ context: T?) {
        navigationController?.pushViewController(instantiateViewController(context), animated: true)
    }
    
    // MARK: - Pop -
    func popFromNavigationController() {
        _ = navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Present -
    func presentFromViewController(_ viewController: UIViewController, animated: Bool = true) {
        let presentedViewController = instantiateViewController(nil as String?)
        presentedViewController.modalPresentationStyle = .fullScreen
        viewController.present(presentedViewController, animated: animated, completion: nil)
    }
    
    func presentFromViewController(_ viewController: UIViewController, animated: Bool = true, presentation: UIModalPresentationStyle = .fullScreen, modalTransitionStyle: UIModalTransitionStyle = .coverVertical) {
        let presentedViewController = instantiateViewController(nil as String?)
        presentedViewController.modalPresentationStyle = presentation
        presentedViewController.modalTransitionStyle = modalTransitionStyle
        viewController.present(presentedViewController, animated: animated, completion: nil)
    }
    
    func presentFromViewController<T>(_ viewController: UIViewController, context: T, animated: Bool = true) {
        let presentedViewController = instantiateViewController(context)
        presentedViewController.modalPresentationStyle = .fullScreen
        viewController.present(presentedViewController, animated: animated, completion: nil)
    }
    
    // MARK: - Dismiss -
    func dismissViewController() {
        viewController?.dismiss(animated: true, completion: nil)
    }
}

