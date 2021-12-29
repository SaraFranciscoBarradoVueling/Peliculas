//
//  MovieList.swift
//  Peliculas
//
//  Created by Sara Francisco on 28/12/21.
//

import Foundation

internal struct MovieList {
    var page: Int?
    var results: [MovieListItem]?
    var totalPages: Int?
    var totalResults: Int?
    
    init(page: Int,
         results: [MovieListItem],
         totalPages: Int,
         totalResults: Int) {
        self.page = page
        self.results = results
        self.totalPages = totalPages
        self.totalResults = totalResults
    }
}

internal struct MovieListServiceResponse: Decodable {
    let page: Int?
    let results: [MovieListItemServiceResponse]?
    let totalPages: Int?
    let totalResults: Int?
    
    enum CodingKeys: String, CodingKey {
        case page
        case results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
    
}

internal final class MovieListBinding {
    
    static func bind(_ soaMovieList: MovieListServiceResponse) -> MovieList {
        var movieList = MovieList(page: 0, results: [], totalPages: 0, totalResults: 0)
        movieList.page = soaMovieList.page
        movieList.results = MovieListItemBinding.bind(soaMovieList.results ?? [])
        movieList.totalPages = soaMovieList.totalPages
        movieList.totalResults = soaMovieList.totalPages
        return movieList
    }
}
