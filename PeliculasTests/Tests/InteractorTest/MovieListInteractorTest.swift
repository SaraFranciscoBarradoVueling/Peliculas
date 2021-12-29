//
//  MovieListInteractorTest.swift
//  PeliculasTests
//
//  Created by Sara Francisco on 29/12/21.
//

import XCTest
@testable import Peliculas

class MovieListInteractorTest: XCTestCase {

    var interactor: MoviesListInteractor?
    var presenter = MoviesListPresenterMock()
    var externalDM = MoviesListExternalDMMock()
    
    var searchTextMock = "El señor de los anillos"
    var responseMock = MovieListServiceResponse(page: 1,
                                                results: [MovieListItemServiceResponse(adult: false,
                                                                                       backdropPath: "ñalkdjs",
                                                                                       genreIDS: [1,2,2],
                                                                                       id: 2,
                                                                                       originalLanguage: "español",
                                                                                       originalTitle: "titulo original",
                                                                                       overview: "descripcion",
                                                                                       popularity: 6.6,
                                                                                       posterPath: "psoterpath",
                                                                                       releaseDate: "releaseDAte",
                                                                                       title: "titulo",
                                                                                       video: true,
                                                                                       voteAverage: 6.9,
                                                                                       voteCount: 3)],
                                                totalPages: 3,
                                                totalResults: 2)
    var imageUrlMock = ""

    
    override func setUp() {
        interactor = MoviesListInteractor()
        presenter.interactor = interactor
        externalDM.interactor = interactor
        interactor?.externalDM = externalDM
    }
    
    func testgetData() {
        interactor?.getData(searchText: searchTextMock)
        XCTAssertEqual(externalDM.function, .getData)
    }
    
    func testgetImagesaseUrl() {
        interactor?.getImagesBaseUrl()
        XCTAssertEqual(externalDM.function, .getImagesBaseUrl)
    }
    
    func testsuccess() {
        interactor?.success(response: responseMock, imageUrl: imageUrlMock)
        XCTAssertEqual(presenter.function, .defaultState)

    }
    
    func testfailure() {
        interactor?.failure()
        XCTAssertEqual(presenter.function, .defaultState)
    }
}

