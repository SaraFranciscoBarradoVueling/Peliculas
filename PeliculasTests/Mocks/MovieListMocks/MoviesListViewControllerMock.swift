//
//  MoviesListViewControllerMock.swift
//  PeliculasTests
//
//  Created by Sara Francisco on 29/12/21.
//

import Foundation
import UIKit
@testable import Peliculas

internal final class MoviesListViewControllerMock: BaseViewController {
    enum functionType {
        case defaultState
        case loadData
   }
    var presenter: MoviesListPresenterInterface?
    
    var function: functionType = .defaultState

}

extension MoviesListViewControllerMock: MoviesListViewInterface {
    func loadData(movies: [MovieItem]) {
        function = .loadData
    }
}
