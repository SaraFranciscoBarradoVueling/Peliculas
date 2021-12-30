//
//  MoviesListExternalDMMock.swift
//  PeliculasTests
//
//  Created by Sara Francisco on 29/12/21.
//

import Foundation
import UIKit
@testable import Peliculas

internal final class MoviesListExternalDMMock {
    var interactor: MoviesListExternalOutputDMInterface?

    enum functionType {
        case defaultState
        case getData
        case getImagesBaseUrl
        case success
        case failure

    }
    var function: functionType = .defaultState
}

extension MoviesListExternalDMMock: MoviesListExternalInputDMInterface {
    func getData(searchText: String) {
        function = .getData
    }
    
    func getImagesBaseUrl() {
        function = .getImagesBaseUrl
    }

}
extension MoviesListExternalDMMock: MoviesListExternalOutputDMInterface {
    func success(response: MovieListServiceResponse, imageUrl: String) {
        function = .success
    }
    
    func failure() {
        function = .failure
    }
    

}

