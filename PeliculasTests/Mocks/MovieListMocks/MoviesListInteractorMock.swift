//
//  MoviesListInteractorMock.swift
//  PeliculasTests
//
//  Created by Sara Francisco on 29/12/21.
//

import Foundation
import UIKit
@testable import Peliculas

internal final class MoviesListInteractorMock {
    enum functionType {
        case defaultState
        case getData
        case getImagesBaseUrl
        case success
        case failure
   }
    var presenter: MoviesListOutputInteractorInterface?
    
    var function: functionType = .defaultState
}
extension MoviesListInteractorMock: MoviesListInteractorInterface {
    func getData(searchText: String) {
        function = .getData
    }
    
    func getImagesBaseUrl() {
        function = .getImagesBaseUrl
    }

}

extension MoviesListInteractorMock: MoviesListOutputInteractorInterface {
    func success(response: MovieList, imageUrl: String) {
        function = .success
    }
    
    func failure() {
        function = .failure
    }
    
    
}
