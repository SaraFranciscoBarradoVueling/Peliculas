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
        
    }
    
    // MARK: - Private Methods

}
// MARK: - Interactor -
extension MoviesListPresenter: MoviesListOutputInteractorInterface {
    
    // MARK: - Internal Methods

    // MARK: - Private Methods
    
}
