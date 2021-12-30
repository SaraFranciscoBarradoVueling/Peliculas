//
//  DetailRouterMock.swift
//  PeliculasTests
//
//  Created by Sara Francisco on 29/12/21.
//

import Foundation
import UIKit
@testable import Peliculas

internal final class DetailRouterMock {
    var navigationController: UINavigationController?
    
    var viewController: UIViewController?
    
    enum functionType {
        case defaultState
    }
    var function: functionType = .defaultState
}

extension DetailRouterMock: DetailRouterInterface {

    func instantiateViewController<T>(_ context: T?) -> UIViewController {
        return UIViewController()
    }
}
