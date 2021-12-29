//
//  ImagesBaseUrl.swift
//  Peliculas
//
//  Created by Sara Francisco on 29/12/21.
//

import Foundation

internal struct ImagesBaseUrl {
    var images: ImagesBaseUrlItem?
    var changeKeys: [String]?
    
    init(images: ImagesBaseUrlItem,
         changeKeys: [String]) {
        self.images = images
        self.changeKeys = changeKeys
    }
}

internal struct ImagesBaseUrlServiceResponse: Decodable {
    let images: ImagesBaseUrlItemServiceResponse?
    let changeKeys: [String]?
    
    enum CodingKeys: String, CodingKey {
        case images
        case changeKeys = "change_keys"
    }
    
}

internal final class ImagesBaseUrlBinding {
    
    static func bind(_ soaBaseUrl: ImagesBaseUrlServiceResponse) -> ImagesBaseUrl {
        var baseUrl = ImagesBaseUrl(images: ImagesBaseUrlItem(baseURL: "",
                                                              secureBaseURL: "",
                                                              backdropSizes: [],
                                                              logoSizes: [],
                                                              posterSizes: [],
                                                              profileSizes: [],
                                                              stillSizes: []),
                                    changeKeys: [])
        if let images = soaBaseUrl.images {
            baseUrl.images = ImagesBaseUrlItemBinding.bind(images)
        }
        baseUrl.changeKeys = soaBaseUrl.changeKeys
        return baseUrl
    }
}
