//
//  MovieListItem.swift
//  Peliculas
//
//  Created by Sara Francisco on 28/12/21.
//

import Foundation

internal struct MovieListItem {
    var adult: Bool?
    var backdropPath: String?
    var genreIDS: [Int]?
    var id: Int?
    var originalLanguage: String?
    var originalTitle: String?
    var overview: String?
    var popularity: Double?
    var posterPath: String
    var releaseDate: String?
    var title: String?
    var video: Bool?
    var voteAverage: Double?
    var voteCount: Int?


    init(adult: Bool,
         backdropPath: String,
         genreIDS: [Int],
         id: Int,
         originalLanguage: String,
         originalTitle: String,
         overview: String,
         popularity: Double,
         posterPath: String,
         releaseDate: String,
         title: String,
         video: Bool,
         voteAverage: Double,
         voteCount: Int) {
        self.adult = adult
        self.backdropPath = backdropPath
        self.genreIDS = genreIDS
        self.id = id
        self.originalLanguage = originalLanguage
        self.originalTitle = originalTitle
        self.overview = overview
        self.popularity = popularity
        self.posterPath = posterPath
        self.releaseDate = releaseDate
        self.title = title
        self.video = video
        self.voteAverage = voteAverage
        self.voteCount = voteCount
    }
}

internal struct MovieListItemServiceResponse: Decodable {
    let adult: Bool?
    let backdropPath: String?
    let genreIDS: [Int]?
    let id: Int?
    let originalLanguage: String?
    let originalTitle: String?
    let overview: String?
    let popularity: Double?
    let posterPath: String
    let releaseDate: String?
    let title: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview
        case popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title
        case video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }

}

internal final class MovieListItemBinding {
    static func bind(_ soaMovieItems: [MovieListItemServiceResponse]) -> [MovieListItem] {
        var movieItems: [MovieListItem] = []
        soaMovieItems.forEach {
            movieItems.append(MovieListItemBinding.bind($0))
        }
        return movieItems
    }

    static func bind(_ soaMovieItem: MovieListItemServiceResponse) -> MovieListItem {
        var movieItem = MovieListItem(adult: false,
                                      backdropPath: "",
                                      genreIDS: [],
                                      id: 0,
                                      originalLanguage: "",
                                      originalTitle: "",
                                      overview: "",
                                      popularity: 0.0,
                                      posterPath: "",
                                      releaseDate: "",
                                      title: "",
                                      video: false,
                                      voteAverage: 0.0,
                                      voteCount: 0)
        movieItem.adult = soaMovieItem.adult
        movieItem.backdropPath = soaMovieItem.backdropPath
        movieItem.genreIDS = soaMovieItem.genreIDS
        movieItem.id = soaMovieItem.id
        movieItem.originalLanguage = soaMovieItem.originalLanguage
        movieItem.originalTitle = soaMovieItem.originalTitle
        movieItem.overview = soaMovieItem.overview
        movieItem.popularity = soaMovieItem.popularity
        movieItem.posterPath = soaMovieItem.posterPath
        movieItem.releaseDate = soaMovieItem.releaseDate
        movieItem.title = soaMovieItem.title
        movieItem.video = soaMovieItem.video
        movieItem.voteAverage = soaMovieItem.voteAverage
        movieItem.voteCount = soaMovieItem.voteCount
        return movieItem
    }
}
