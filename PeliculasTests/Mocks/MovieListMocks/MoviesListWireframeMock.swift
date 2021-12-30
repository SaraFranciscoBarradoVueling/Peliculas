//
//  MoviesListWireframeMock.swift
//  PeliculasTests
//
//  Created by Sara Francisco on 29/12/21.
//

import Foundation
import UIKit
@testable import Peliculas

internal final class MoviesListWireframeMock {

    enum functionType {
        case defaultState
        case setUpViews
        case noResultsLoading
        case noResultsInitialState
        case noResultsErrorView
        case noResultsView
        case noResultsViewHidden
    }
    var function: functionType = .defaultState
}

extension MoviesListWireframeMock: MoviesListWireframeInterface {
    func setUpViews() {
        function = .setUpViews
    }

    func noResultsLoading(searchText: String) {
        function = .noResultsLoading
    }

    func noResultsInitialState() {
        function = .noResultsInitialState
    }

    func noResultsErrorView() {
        function = .noResultsErrorView
    }

    func noResultsView() {
        function = .noResultsView
    }

    func noResultsViewHidden(hidden: Bool) {
        function = .noResultsViewHidden
    }
}
