//
//  MoviesListInteractor.swift
//  Peliculas
//
//  Created by Sara Francisco on 26/12/21.
//

import UIKit

internal final class MoviesListInteractor {
    
    // MARK: - Variables
    internal var presenter: MoviesListOutputInteractorInterface?
    internal var externalDM:  MoviesListExternalInputDMInterface?
    internal var localDM:  MoviesListLocalInputDMInterface?

}

// MARK: - Interactor -
extension MoviesListInteractor: MoviesListInteractorInterface {

    // MARK: - Internal Methods
    func getData(searchText: String) {
        externalDM?.getData(searchText: searchText)
    }
    
    func getImagesaseUrl() {
        externalDM?.getImagesaseUrl()
    }
    
    // MARK: - Private Methods
    
}

// MARK: - LocalDM -
extension MoviesListInteractor: MoviesListLocalOutputDMInterface {

    // MARK: - Internal Methods

    // MARK: - Private Methods
    
}

// MARK: - ExternalDM -
extension MoviesListInteractor: MoviesListExternalOutputDMInterface {
    func success(response: MovieListServiceResponse, imageUrl: String) {
        let data = MovieListBinding.bind(response)
        presenter?.success(response: data, imageUrl: imageUrl)
    }
    
    func failure() {
        presenter?.failure()
    }
    
    // MARK: - Internal Methods

    // MARK: - Private Methods
}

