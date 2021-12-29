//
//  DetailInterfaces.swift
//  Peliculas
//
//  Created by Sara Francisco on 29/12/21.
//

import Foundation

// MARK: - View
protocol DetailViewInterface: BaseViewController {
    var presenter: DetailPresenterInterface? { get set }
    // Presenter -> ViewController
}

// MARK: - Presenter
protocol DetailPresenterInterface {
    var wireframe: DetailWireframeInterface? { get }
    var view: DetailViewInterface? { get }
    var router: DetailRouterInterface? { get }
    // ViewController -> Presenter
    func viewDidLoad()
    func getItem()-> MovieItem
}

// MARK: - Router
protocol DetailRouterInterface: RouterInterface {
    // Presenter -> Router
}

// MARK: - Wireframe
protocol DetailWireframeInterface {
    // Presenter -> Wireframe
    func setUpViews()
}

