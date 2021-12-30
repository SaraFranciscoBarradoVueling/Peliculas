//
//  DetailViewControllerMock.swift
//  PeliculasTests
//
//  Created by Sara Francisco on 29/12/21.
//

import Foundation
import UIKit
@testable import Peliculas

internal final class DetailViewControllerMock: BaseViewController {
    enum functionType {
        case defaultState
        case loadData
   }
    var presenter: DetailPresenterInterface?
    
    var function: functionType = .defaultState

}

extension DetailViewControllerMock: DetailViewInterface {

}
