//
//  MoviesListPresenterTest.swift
//  PeliculasTests
//
//  Created by Sara Francisco on 29/12/21.
//

import XCTest
@testable import Peliculas

class MoviesListPresenterTest: XCTestCase {
    
    var presenter: MoviesListPresenter?
    var interactor = MoviesListInteractorMock()
    var router = MoviesListRouterMock()
    var view =  MoviesListViewControllerMock()
    var wireframe = MoviesListWireframeMock()
    
    var hiddenMock = true
    var searchTextMock = "asdfasdfas"
    var searchTextWithResultsMock = "El Hobbit"
    var movieItemMock = MovieItem(image: UIImage(),
                                  title: "El Hobbit",
                                  description: "la pelicula del Hobbit",
                                  voteAverage: "9.5",
                                  id: 33)
    
    override func setUp() {
        presenter = MoviesListPresenter(wireframe: wireframe, view: view, router: router)
        interactor.presenter = presenter
        presenter?.interactor = interactor
    }
    
    func testviewDidLoad(){
        presenter?.viewDidLoad()
        XCTAssertEqual(wireframe.function, .setUpViews)
    }
    
    func testnoResultsViewHidden() {
        presenter?.noResultsViewHidden(hidden: hiddenMock)
        XCTAssertEqual(wireframe.function, .noResultsViewHidden)
    }

    func testnoResultsLoading() {
        presenter?.noResultsLoading(searchText: searchTextMock)
        XCTAssertEqual(wireframe.function, .noResultsLoading)
    }

    func testnoResultsInitialState() {
        presenter?.noResultsInitialState()
        XCTAssertEqual(wireframe.function, .noResultsInitialState)
    }

    func testgetData() {
        presenter?.getData(searchText: searchTextWithResultsMock)
        XCTAssertEqual(interactor.function, .getData)
    }

    func testgetImagesaseUrl() {
        presenter?.getImagesaseUrl()
        XCTAssertEqual(interactor.function, .getImagesBaseUrl)
    }

    func testnavitageToDetail() {
        presenter?.navitageToDetail(selectedItem: movieItemMock)
        XCTAssertEqual(router.function, .navitageToDetail)
    }
    
}
