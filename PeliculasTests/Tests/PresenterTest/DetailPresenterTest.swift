//
//  DetailPresenterTest.swift
//  PeliculasTests
//
//  Created by Sara Francisco on 29/12/21.
//

import XCTest
@testable import Peliculas

class DetailPresenterTest: XCTestCase {
    
    var presenter: DetailPresenter?
    var router = DetailRouterMock()
    var view =  DetailViewControllerMock()
    var wireframe = DetailWireframeMock()
    
    var itemMock = MovieItem(image: UIImage(),
                             title: "El señor de los anillos",
                             description: "descripción",
                             voteAverage: "8.4",
                             id: 223)
    
    
    override func setUp() {
        presenter = DetailPresenter(wireframe: wireframe, view: view, router: router, item: itemMock)
    }
    
 
    func testviewDidLoad() {
        presenter?.viewDidLoad()
        XCTAssertEqual(wireframe.function, .setUpViews)
    }
    
    
}
