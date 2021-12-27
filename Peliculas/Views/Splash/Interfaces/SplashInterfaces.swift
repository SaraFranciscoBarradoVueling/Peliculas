//
//  SplashInterfaces.swift
//  Peliculas
//
//  Created by Sara Francisco on 27/12/21.
//

import Foundation

// MARK: - View
protocol SplashViewInterface: BaseViewController {
    var presenter: SplashPresenterInterface? { get set }
    // Presenter -> ViewController
}

// MARK: - Presenter
protocol SplashPresenterInterface {
    var wireframe: SplashWireframeInterface? { get }
    var view: SplashViewInterface? { get }
    var interactor: SplashInteractorInterface? { get }
    var router: SplashRouterInterface? { get }
    // ViewController -> Presenter
    func viewDidLoad()
}

// MARK: - Interactor
protocol SplashInteractorInterface {
    var presenter: SplashOutputInteractorInterface? { get set }
    // Presenter -> Interactor
    func getData()
}

protocol SplashOutputInteractorInterface  {
    // Interactor -> Presenter
    func navigateToMoviesList()
    func showError(error: ServiceError)
}

// MARK: - ExternalDM
protocol SplashExternalInputDMInterface {
    var interactor: SplashExternalOutputDMInterface? { get set }
    // Interactor -> External Data Manager
    func getData()
}

protocol SplashExternalOutputDMInterface: class {
    // External Data Manager -> Interactor
    func navigateToMoviesList()
    func showError(error: ServiceError)
}

// MARK: - LocalDM
protocol SplashLocalInputDMInterface {
    var interactor: SplashLocalOutputDMInterface? { get set }
    // Interactor -> Local Data Manager
}

protocol SplashLocalOutputDMInterface: class {
    // Local Data Manager -> Interactor
}

// MARK: - Router
protocol SplashRouterInterface: RouterInterface {
    // Presenter -> Router
    func navigateToMoviesList()
}

// MARK: - Wireframe
protocol SplashWireframeInterface {
    // Presenter -> Wireframe
    func setupViews()
    func showGeneralErrorScreen()
}
