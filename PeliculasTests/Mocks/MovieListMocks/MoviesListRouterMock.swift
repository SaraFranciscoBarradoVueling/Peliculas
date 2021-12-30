//
//  MoviesListRouterMock.swift
//  PeliculasTests
//
//  Created by Sara Francisco on 29/12/21.
//

import Foundation
import UIKit
@testable import Peliculas

internal final class MoviesListRouterMock {
    var navigationController: UINavigationController?
    
    var viewController: UIViewController?
    
    enum functionType {
        case defaultState
        case navitageToDetail
    }
    var function: functionType = .defaultState
}

extension MoviesListRouterMock: MoviesListRouterInterface {
    func navitageToDetail(selectedItem: MovieItem) {
        function = .navitageToDetail
    }

    func instantiateViewController<T>(_ context: T?) -> UIViewController {
        return UIViewController()
    }
}
