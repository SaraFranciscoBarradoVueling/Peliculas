//
//  MoviesListPresenterMock.swift
//  PeliculasTests
//
//  Created by Sara Francisco on 29/12/21.
//

import Foundation
import UIKit
@testable import Peliculas

internal final class MoviesListPresenterMock {
    var wireframe: MoviesListWireframeInterface?
    var view: MoviesListViewInterface?
    var interactor: MoviesListInteractorInterface?
    var router: MoviesListRouterInterface?
    
    enum functionType {
        case defaultState
        case viewDidLoad
        case noResultsLoading
        case noResultsInitialState
        case getData
        case getImagesaseUrl
        case navitageToDetail
        case noResultsViewHidden
    }
    var function: functionType = .defaultState
}

extension MoviesListPresenterMock: MoviesListPresenterInterface {
    func viewDidLoad() {
        function = .viewDidLoad
    }
    
    func noResultsLoading(searchText: String) {
        function = .noResultsLoading
    }
    
    func noResultsInitialState() {
        function = .noResultsInitialState
    }
    
    func getData(searchText: String) {
        function = .getData
    }
    
    func getImagesaseUrl() {
        function = .getImagesaseUrl
    }
    
    func navitageToDetail(selectedItem: MovieItem) {
        function = .navitageToDetail
    }
    
    func noResultsViewHidden(hidden: Bool) {
        function = .noResultsViewHidden
    }
}
