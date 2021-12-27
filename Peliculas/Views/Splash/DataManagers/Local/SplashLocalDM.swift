//
//  SplashLocalDM.swift
//  Peliculas
//
//  Created by Sara Francisco on 27/12/21.
//

import UIKit

internal final class SplashLocalDM {
    
    // MARK: - Variables
    weak var interactor: SplashLocalOutputDMInterface?
    
    // MARK: - Lifecycle Methods
    init(interactor: SplashLocalOutputDMInterface) {
        self.interactor = interactor
    }
}

// MARK: - LocalDM -
extension SplashLocalDM: SplashLocalInputDMInterface {
    
    // MARK: - Internal Methods
}
