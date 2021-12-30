//
//  MoviesListRouter.swift
//  Peliculas
//
//  Created by Sara Francisco on 26/12/21.
//

import UIKit

internal final class MoviesListRouter {
    
    // MARK: - Variables
    weak var navigationController: UINavigationController?
    weak var viewController: UIViewController?
    
    // MARK: - Internal Methods
    func instantiateViewController<T>(_ context: T) -> UIViewController {
        let vc = MoviesListViewController(nibName: String(describing: MoviesListViewController.self), bundle: nil)
        let interactor = MoviesListInteractor()
        let localDM = MoviesListLocalDM(interactor: interactor)
        let externalDM = MoviesListExternalDM(interactor: interactor)
        let wireframe = MoviesListWireframe(view: vc)
        let presenter = MoviesListPresenter(wireframe: wireframe, view: vc, interactor: interactor, router: self)
        vc.presenter = presenter
        interactor.presenter = presenter
        interactor.localDM = localDM
        interactor.externalDM = externalDM
        self.viewController = vc
        return vc
    }
}

// MARK: - Router -
extension MoviesListRouter: MoviesListRouterInterface {
    func navitageToDetail(selectedItem: MovieItem) {
        if let vc = viewController {
            let detailRouter = DetailRouter()
            detailRouter.item = selectedItem
            detailRouter.presentFromViewController(vc,
                                                   animated: true,
                                                   presentation: .formSheet,
                                                   modalTransitionStyle: .coverVertical)
        }
    }
    
    
    // MARK: - Internal Methods

}


