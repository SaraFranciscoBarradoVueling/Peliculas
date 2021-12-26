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

}
