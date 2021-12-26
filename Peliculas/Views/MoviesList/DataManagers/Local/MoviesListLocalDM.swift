//
//  MoviesListLocalDM.swift
//  Peliculas
//
//  Created by Sara Francisco on 26/12/21.
//

import UIKit

internal final class MoviesListLocalDM {
    
    // MARK: - Variables
    weak var interactor: MoviesListLocalOutputDMInterface?
    
    // MARK: - Lifecycle Methods
    init(interactor: MoviesListLocalOutputDMInterface) {
        self.interactor = interactor
    }
}

// MARK: - LocalDM -
extension MoviesListLocalDM: MoviesListLocalInputDMInterface {
    
    // MARK: - Internal Methods
}

