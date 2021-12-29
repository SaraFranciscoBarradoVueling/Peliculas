//
//  ImagesBaseUrlItem.swift
//  Peliculas
//
//  Created by Sara Francisco on 29/12/21.
//

import Foundation

internal struct ImagesBaseUrlItem {
    var baseURL: String?
    var secureBaseURL: String?
    var backdropSizes: [String]?
    var logoSizes: [String]?
    var posterSizes: [String]?
    var profileSizes: [String]?
    var stillSizes: [String]?

    init(baseURL: String,
         secureBaseURL: String,
         backdropSizes:[String],
         logoSizes: [String],
         posterSizes: [String],
         profileSizes: [String],
         stillSizes: [String]) {
        self.baseURL = baseURL
        self.secureBaseURL = secureBaseURL
        self.backdropSizes = backdropSizes
        self.logoSizes = logoSizes
        self.posterSizes = posterSizes
        self.profileSizes = profileSizes
        self.stillSizes = stillSizes
    }
}

internal struct ImagesBaseUrlItemServiceResponse: Decodable {
    let baseURL: String?
    let secureBaseURL: String?
    let backdropSizes: [String]?
    let logoSizes: [String]?
    let posterSizes: [String]?
    let profileSizes: [String]?
    let stillSizes: [String]?

    enum CodingKeys: String, CodingKey {
        case baseURL = "base_url"
        case secureBaseURL = "secure_base_url"
        case backdropSizes = "backdrop_sizes"
        case logoSizes = "logo_sizes"
        case posterSizes = "poster_sizes"
        case profileSizes = "profile_sizes"
        case stillSizes = "still_sizes"
    }
}

internal final class ImagesBaseUrlItemBinding {
    static func bind(_ soaurls: [ImagesBaseUrlItemServiceResponse]) -> [ImagesBaseUrlItem] {
        var urls: [ImagesBaseUrlItem] = []
        soaurls.forEach {
            urls.append(ImagesBaseUrlItemBinding.bind($0))
        }
        return urls
    }
    
    static func bind(_ soaBaseUrl: ImagesBaseUrlItemServiceResponse) -> ImagesBaseUrlItem {
        var baseUrl = ImagesBaseUrlItem(baseURL: "",
                                        secureBaseURL: "",
                                        backdropSizes: [],
                                        logoSizes: [],
                                        posterSizes: [],
                                        profileSizes: [],
                                        stillSizes: [])
        baseUrl.baseURL = soaBaseUrl.baseURL
        baseUrl.secureBaseURL = soaBaseUrl.secureBaseURL
        baseUrl.backdropSizes = soaBaseUrl.backdropSizes
        baseUrl.logoSizes = soaBaseUrl.logoSizes
        baseUrl.posterSizes = soaBaseUrl.posterSizes
        baseUrl.profileSizes = soaBaseUrl.profileSizes
        baseUrl.stillSizes = soaBaseUrl.stillSizes
        return baseUrl
    }
}
