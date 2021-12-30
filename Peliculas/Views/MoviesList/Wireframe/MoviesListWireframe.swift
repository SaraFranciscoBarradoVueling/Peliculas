//
//  MoviesListWireframe.swift
//  Peliculas
//
//  Created by Sara Francisco on 26/12/21.
//

import UIKit

internal final class MoviesListWireframe {

    // MARK: - Variables
    internal var view: MoviesListViewController

    // MARK: - Lifecycle Methods
    init(view: MoviesListViewController) {
        self.view = view
    }
}

// MARK: - Wireframe -
extension MoviesListWireframe: MoviesListWireframeInterface {

    // MARK: - Public Methods
    func setUpViews() {
        view.definesPresentationContext = true
        setUpNavigationController()
        setUpSearchController()
        noResultsInitialState()
    }
    func noResultsViewHidden(hidden: Bool) {
        view.noResultsView.isHidden = hidden
    }

    func noResultsLoading(searchText: String) {
        view.noResultsView.isHidden = false
        view.noResultsLabel.text = "Loading results including: \"\(searchText)\""
        view.noResultsImageView.image = UIImage(named: "loadingIcon")
        movieLoaderStart()
    }

    func noResultsInitialState() {
        view.noResultsView.isHidden = false
        view.noResultsLabel.text = "Let's search movies introducing a key word"
        view.noResultsImageView.image = UIImage(named: "clapperboard")
        view.noResultsImageView.layer.removeAllAnimations()
    }
    
    func noResultsErrorView() {
        view.noResultsView.isHidden = false
        view.noResultsLabel.text = "Oops an error ocurred \nTry again"
        view.noResultsImageView.image = UIImage(named: "anErrorOcurred")
        view.noResultsImageView.layer.removeAllAnimations()
    }
    
    func noResultsView() {
        view.noResultsView.isHidden = false
        view.noResultsLabel.text = "Oops there is no results \nfor this search"
        view.noResultsImageView.image = UIImage(named: "noResults")
        view.noResultsImageView.layer.removeAllAnimations()
    }
    
    // MARK: - Private Methods
    private func setUpNavigationController() {
        view.navigationController?.navigationBar.isHidden = false
        view.navigationItem.title = "Peliculas"
    }

    private func setUpSearchController() {
        view.resultSearchController = ({
            let controller = UISearchController(searchResultsController: nil)
            controller.searchBar.delegate = view
            controller.obscuresBackgroundDuringPresentation = false
            controller.searchBar.sizeToFit()
            controller.searchBar.searchBarStyle = .minimal
            controller.searchBar.backgroundColor = UIColor.clear
            view.tableView.tableHeaderView = controller.searchBar
            return controller
        })()
    }

    private func movieLoaderStart() {
        let animation = CABasicAnimation(keyPath: MoviesListConstants.animationKey)
        animation.fromValue = 0
        animation.toValue = Double.pi * 2.0
        animation.duration = 2
        animation.repeatCount = .infinity
        animation.isRemovedOnCompletion = false

        view.noResultsImageView.layer.add(animation, forKey: MoviesListConstants.spin)
    }
}
