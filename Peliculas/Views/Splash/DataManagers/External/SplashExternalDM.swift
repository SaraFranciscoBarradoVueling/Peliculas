//
//  SplashExternalDM.swift
//  Peliculas
//
//  Created by Sara Francisco on 27/12/21.
//

import UIKit

internal final class SplashExternalDM {
    
    // MARK: - Variables
    weak var interactor: SplashExternalOutputDMInterface?
    
    // MARK: - Lifecycle Methods
    init(interactor: SplashExternalOutputDMInterface) {
        self.interactor = interactor
    }
}

// MARK: - ExternalDM -
extension SplashExternalDM: SplashExternalInputDMInterface {
    func getData() {
        //get movies data
    }
    
    
    // MARK: - Internal Methods
}

