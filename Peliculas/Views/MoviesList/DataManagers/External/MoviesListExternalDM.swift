//
//  MoviesListExternalDM.swift
//  Peliculas
//
//  Created by Sara Francisco on 26/12/21.
//


import UIKit

internal final class MoviesListExternalDM {
    
    // MARK: - Variables
    weak var interactor: MoviesListExternalOutputDMInterface?
    
    // MARK: - Lifecycle Methods
    init(interactor: MoviesListExternalOutputDMInterface) {
        self.interactor = interactor
    }
}

// MARK: - ExternalDM -
extension MoviesListExternalDM: MoviesListExternalInputDMInterface {
    
    // MARK: - Internal Methods
    func getData(searchText: String) {
        WebService.request(route: .getMovieList(query: "el señor de los anillos"),
                           responseModel: MovieListServiceResponse.self) { (result) in
            switch result {
            case .success(_):
                self.interactor?.success()
            case .failure(_):
                self.interactor?.failure()
            }
        }
    }
    


}
