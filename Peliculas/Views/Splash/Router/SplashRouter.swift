//
//  SplashRouter.swift
//  Peliculas
//
//  Created by Sara Francisco on 27/12/21.
//

import UIKit

internal final class SplashRouter {
    
    // MARK: - Variables
    weak var navigationController: UINavigationController?
    weak var viewController: UIViewController?
    
    // MARK: - Internal Methods
    func instantiateViewController<T>(_ context: T) -> UIViewController {
        let vc = SplashViewController(nibName: String(describing: SplashViewController.self), bundle: nil)
        let interactor = SplashInteractor()
        let localDM = SplashLocalDM(interactor: interactor)
        let externalDM = SplashExternalDM(interactor: interactor)
        let wireframe = SplashWireframe(view: vc)
        let presenter = SplashPresenter(wireframe: wireframe, view: vc, interactor: interactor, router: self)
        vc.presenter = presenter
        interactor.presenter = presenter
        interactor.localDM = localDM
        interactor.externalDM = externalDM
        self.viewController = vc
        return vc
    }
}

// MARK: - Router -
extension SplashRouter: SplashRouterInterface {

    // MARK: - Internal Methods
    func navigateToMoviesList() {
        let moviesListRouter = MoviesListRouter()
        moviesListRouter.navigationController = navigationController
        moviesListRouter.pushOnNavigationController(animation: false)
    }
}


