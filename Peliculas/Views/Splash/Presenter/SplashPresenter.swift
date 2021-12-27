//
//  SplashPresenter.swift
//  Peliculas
//
//  Created by Sara Francisco on 27/12/21.
//

import Foundation

internal final class SplashPresenter {
    
    // MARK: - Variables
    internal var wireframe: SplashWireframeInterface?
    internal var view: SplashViewInterface?
    internal var interactor: SplashInteractorInterface?
    internal var router: SplashRouterInterface?
    
    // MARK: - Lifecycle Methods
    init(wireframe: SplashWireframeInterface, view: SplashViewInterface, interactor: SplashInteractorInterface? = nil, router: SplashRouterInterface) {
        self.wireframe = wireframe
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

// MARK: - Presenter -
extension SplashPresenter: SplashPresenterInterface {
    // MARK: - Internal Methods
    func viewDidLoad() {
        wireframe?.setupViews()
        getData()
    }
    
    // MARK: - Private Methods
    private func getData() {
        interactor?.getData()
    }
}

// MARK: - Interactor -
extension SplashPresenter: SplashOutputInteractorInterface {
    // MARK: - Internal Methods
    func navigateToMoviesList() {
        router?.navigateToMoviesList()
    }
    
    func showError(error: ServiceError) {
        view?.showError(error: error)
        wireframe?.showGeneralErrorScreen()
    }
}

