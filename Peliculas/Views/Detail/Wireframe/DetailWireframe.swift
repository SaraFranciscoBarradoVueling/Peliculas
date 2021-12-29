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
        view.titleLabel.textColor = UIColor.black
        view.titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        view.votesLabel.textColor = UIColor.black
        view.votesLabel.backgroundColor = UIColor.white
        view.votesLabel.layer.masksToBounds = true
        view.votesLabel.layer.cornerRadius = view.votesLabel.frame.size.height/2.0
        view.votesLabel.font = UIFont.boldSystemFont(ofSize: 40)
        view.descLabel.textColor = UIColor.black
        view.descLabel.font = UIFont.italicSystemFont(ofSize: 12)
    }
}

