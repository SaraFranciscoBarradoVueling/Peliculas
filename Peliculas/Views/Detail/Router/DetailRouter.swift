//
//  DetailRouter.swift
//  Peliculas
//
//  Created by Sara Francisco on 29/12/21.
//

import UIKit

internal final class DetailRouter {

    // MARK: - Variables
    weak var navigationController: UINavigationController?
    weak var viewController: UIViewController?
    var item: MovieItem!

    // MARK: - Internal Methods
    func instantiateViewController<T>(_ context: T) -> UIViewController {
        let vc = DetailViewController(nibName: String(describing: DetailViewController.self), bundle: nil)
        let wireframe = DetailWireframe(view: vc)
        let presenter = DetailPresenter(wireframe: wireframe, view: vc, router: self, item: item)
        vc.presenter = presenter

        self.viewController = vc
        return vc
    }
}

// MARK: - Router -
extension DetailRouter: DetailRouterInterface {

}
