//
//  MoviesListInterfaces.swift
//  Peliculas
//
//  Created by Sara Francisco on 26/12/21.
//

import Foundation

// MARK: - View
protocol MoviesListViewInterface: BaseViewController {
    var presenter: MoviesListPresenterInterface? { get set }
    // Presenter -> ViewController
}

// MARK: - Presenter
protocol MoviesListPresenterInterface {
    var wireframe: MoviesListWireframeInterface? { get }
    var view: MoviesListViewInterface? { get }
    var interactor: MoviesListInteractorInterface? { get }
    var router: MoviesListRouterInterface? { get }
    // ViewController -> Presenter
    func viewDidLoad()
}

// MARK: - Interactor
protocol MoviesListInteractorInterface {
    var presenter: MoviesListOutputInteractorInterface? { get set }
    // Presenter -> Interactor
}

protocol MoviesListOutputInteractorInterface  {
    // Interactor -> Presenter

    
}

// MARK: - ExternalDM
protocol MoviesListExternalInputDMInterface {
    var interactor: MoviesListExternalOutputDMInterface? { get set }
    // Interactor -> External Data Manager
}

protocol MoviesListExternalOutputDMInterface: class {
    // External Data Manager -> Interactor

}

// MARK: - LocalDM
protocol MoviesListLocalInputDMInterface {
    var interactor: MoviesListLocalOutputDMInterface? { get set }
    // Interactor -> Local Data Manager
}

protocol MoviesListLocalOutputDMInterface: class {
    // Local Data Manager -> Interactor
}

// MARK: - Router
protocol MoviesListRouterInterface: RouterInterface {
    // Presenter -> Router
}

// MARK: - Wireframe
protocol MoviesListWireframeInterface {
    // Presenter -> Wireframe
}

