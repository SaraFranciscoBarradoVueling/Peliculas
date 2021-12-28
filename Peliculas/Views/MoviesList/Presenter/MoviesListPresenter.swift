//
//  MoviesListPresenter.swift
//  Peliculas
//
//  Created by Sara Francisco on 26/12/21.
//

import UIKit

internal final class MoviesListPresenter {
    
    // MARK: - Variables
    internal var wireframe: MoviesListWireframeInterface?
    internal var view: MoviesListViewInterface?
    internal var interactor: MoviesListInteractorInterface?
    internal var router: MoviesListRouterInterface?
    
    // MARK: - Lifecycle Methods
    init(wireframe: MoviesListWireframeInterface,
         view: MoviesListViewInterface,
         interactor: MoviesListInteractorInterface? = nil,
         router: MoviesListRouterInterface) {
        self.wireframe = wireframe
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

// MARK: - Presenter -
extension MoviesListPresenter: MoviesListPresenterInterface {

    // MARK: - Internal Methods
    func viewDidLoad(){
        wireframe?.setUpViews()
    }
    
    func noResultsLoading(searchText: String) {
        wireframe?.noResultsLoading(searchText: searchText)
    }
    
    func noResultsInitialState() {
        wireframe?.noResultsInitialState()
    }
    
    func getData(searchText: String) {
        interactor?.getData(searchText: searchText)
    }
    
    // MARK: - Private Methods

}
// MARK: - Interactor -
extension MoviesListPresenter: MoviesListOutputInteractorInterface {
    func success() {
        // exito en la llamda a la lista de peliculas
        // si el resultado es vacío muestras el empty state
        // si tienes datos recargas la tabla
    }
    
    func failure() {
        wireframe?.noResultsErrorView()
    }
    
    
    // MARK: - Internal Methods

    // MARK: - Private Methods
    
}
