//
//  DetailWireframe.swift
//  Peliculas
//
//  Created by Sara Francisco on 29/12/21.
//

import UIKit

internal final class DetailWireframe {

    // MARK: - Variables
    internal var view: DetailViewController

    // MARK: - Lifecycle Methods
    init(view: DetailViewController) {
        self.view = view
    }
}

// MARK: - Wireframe -
extension DetailWireframe: DetailWireframeInterface {

    // MARK: - Public Methods
    func setUpViews() {
        setUpNavigationController()
        setUpViewsInitialState()
    }

    
    // MARK: - Private Methods
    private func setUpNavigationController() {
        view.navigationController?.navigationBar.isHidden = false
    }
    
    private func setUpViewsInitialState() {
        view.titleLabel.textColor = UIColor.white
        view.titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        view.votesLabel.textColor = UIColor.white
        view.votesLabel.font = UIFont.boldSystemFont(ofSize: 12)
        view.descLabel.textColor = UIColor.white
        view.descLabel.font = UIFont.boldSystemFont(ofSize: 12)
    }
}

