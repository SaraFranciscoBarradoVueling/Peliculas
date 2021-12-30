//
//  DetailWireframeMock.swift
//  PeliculasTests
//
//  Created by Sara Francisco on 29/12/21.
//

import Foundation
import UIKit
@testable import Peliculas

internal final class DetailWireframeMock {

    enum functionType {
        case defaultState
        case setUpViews
    }
    var function: functionType = .defaultState
}

extension DetailWireframeMock: DetailWireframeInterface {
    func setUpViews() {
        function = .setUpViews
    }
    

}
