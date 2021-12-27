//
//  SplashInteractor.swift
//  Peliculas
//
//  Created by Sara Francisco on 27/12/21.
//

import UIKit

internal final class SplashInteractor {
    
    // MARK: - Variables
    internal var presenter: SplashOutputInteractorInterface?
    internal var externalDM:  SplashExternalInputDMInterface?
    internal var localDM:  SplashLocalInputDMInterface?
}

// MARK: - Interactor -
extension  SplashInteractor:  SplashInteractorInterface {
    // MARK: - Internal Methods
    func getData() {
        externalDM?.getData()
    }
    
    // MARK: - Private Methods
    

}

// MARK: - LocalDM -
extension  SplashInteractor:  SplashLocalOutputDMInterface {

}

// MARK: - ExternalDM -
extension SplashInteractor: SplashExternalOutputDMInterface {

    // MARK: - Internal Methods
    func navigateToMoviesList() {
        presenter?.navigateToMoviesList()
    }
    
    func showError(error: ServiceError) {
        presenter?.showError(error: error)
    }
}
