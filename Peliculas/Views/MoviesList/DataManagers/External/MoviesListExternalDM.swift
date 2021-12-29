//
//  MoviesListExternalDM.swift
//  Peliculas
//
//  Created by Sara Francisco on 26/12/21.
//


import UIKit

internal final class MoviesListExternalDM {
    
    // MARK: - Variables
    weak var interactor: MoviesListExternalOutputDMInterface?
    var baseUrl: String = ""
    
    // MARK: - Lifecycle Methods
    init(interactor: MoviesListExternalOutputDMInterface) {
        self.interactor = interactor
    }
}

// MARK: - ExternalDM -
extension MoviesListExternalDM: MoviesListExternalInputDMInterface {
    
    // MARK: - Internal Methods
    func getData(searchText: String) {
            WebService.request(route: .getMovieList(query: searchText),
                           responseModel: MovieListServiceResponse.self) { (result) in
            switch result {
            case .success(let response):
                self.interactor?.success(response: response, imageUrl: self.baseUrl)
            case .failure(_):
                self.interactor?.failure()
            }
        }
    }
    
    func getImagesaseUrl() {
        WebService.request(route: .getImagesBaseUrl,
                           responseModel: ImagesBaseUrlServiceResponse.self) { (result) in
            switch result {
            case .success(let response):
                self.createImagesBaseUrl(response: response)
            case .failure(_):
                print("imposible get base url of images, so show defaul image")
            }
        }
    }
    
    // MARK: - Private Methods
    
    private func createImagesBaseUrl(response: ImagesBaseUrlServiceResponse) -> String{
        let basesUrl = ImagesBaseUrlBinding.bind(response)
        if let img = basesUrl.images {
            if let securebase = img.secureBaseURL, let size = img.backdropSizes?.first {
                self.baseUrl = securebase + size
            }
        }
        return baseUrl
    }


}
