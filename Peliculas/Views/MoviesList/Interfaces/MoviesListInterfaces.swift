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
    func loadData(movies: [MovieItem])
}

// MARK: - Presenter
protocol MoviesListPresenterInterface {
    var wireframe: MoviesListWireframeInterface? { get }
    var view: MoviesListViewInterface? { get }
    var interactor: MoviesListInteractorInterface? { get }
    var router: MoviesListRouterInterface? { get }
    // ViewController -> Presenter
    func viewDidLoad()
    func noResultsLoading(searchText: String)
    func noResultsInitialState()
    func getData(searchText: String)
    func getImagesaseUrl()
    func navitageToDetail(selectedItem: MovieItem)
    func noResultsViewHidden(hidden: Bool)
    
}

// MARK: - Interactor
protocol MoviesListInteractorInterface {
    var presenter: MoviesListOutputInteractorInterface? { get set }
    // Presenter -> Interactor
    func getData(searchText: String)
    func getImagesBaseUrl()
}

protocol MoviesListOutputInteractorInterface  {
    // Interactor -> Presenter
    func success(response: MovieList, imageUrl: String)
    func failure(error: ServiceError)
}

// MARK: - ExternalDM
protocol MoviesListExternalInputDMInterface {
    var interactor: MoviesListExternalOutputDMInterface? { get set }
    // Interactor -> External Data Manager
    func getData(searchText: String)
    func getImagesBaseUrl()
}

protocol MoviesListExternalOutputDMInterface: class {
    // External Data Manager -> Interactor
    func success(response: MovieListServiceResponse, imageUrl: String)
    func failure(error: ServiceError)
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
    func navitageToDetail(selectedItem: MovieItem)
}

// MARK: - Wireframe
protocol MoviesListWireframeInterface {
    // Presenter -> Wireframe
    func setUpViews()
    func noResultsLoading(searchText: String)
    func noResultsInitialState()
    func noResultsErrorView()
    func noResultsView()
    func noResultsViewHidden(hidden: Bool)
}

