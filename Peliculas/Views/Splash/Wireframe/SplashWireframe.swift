//
//  SplashWireframe.swift
//  Peliculas
//
//  Created by Sara Francisco on 27/12/21.
//

import Foundation
import UIKit

internal final class SplashWireframe {
    
    // MARK: - Variables
    internal var view: SplashViewController
    
    // MARK: - Lifecycle Methods
    init(view: SplashViewController) {
        self.view = view
    }
}

// MARK: - Wireframe -
extension SplashWireframe: SplashWireframeInterface {
    // MARK: - Internal Methods
    func setupViews() {
        movieLoaderStart()
        setupImageSplash()
        initialViewErrorState()
        setupErrorMesage()
    }
    
    func showGeneralErrorScreen() {
        view.errorView.isHidden = false
    }
    
    func initialViewErrorState() {
        view.errorView.isHidden = true
    }
    
    // MARK: - Private Methods
    private func setupImageSplash() {
        view.logoImageView.layer.cornerRadius = 10
    }
    
    private func setupErrorMesage() {
        view.errorLabel.text = SplashConstants.errorViewMessage
    }
    
    private func movieLoaderStart() {
        let animation = CABasicAnimation(keyPath: SplashConstants.animationKey)
        animation.fromValue = 0
        animation.toValue =  Double.pi * 2.0
        animation.duration = 2
        animation.repeatCount = .infinity
        animation.isRemovedOnCompletion = false
        
        view.loadingImageView.layer.add(animation, forKey: SplashConstants.spin)
    }

}

