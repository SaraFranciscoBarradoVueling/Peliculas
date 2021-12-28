//
//  ServiceRoutes.swift
//  Peliculas
//
//  Created by Sara Francisco on 27/12/21.
//

import Foundation

internal enum ServiceRoutes {
    case getMovieList(query: String)
    case getMovieDetail(id:Int)
}
extension ServiceRoutes: ServiceConfigurationProtocol {
    
    // MARK: - Constants
    private enum Constants {
        static let timeout: TimeInterval = 30
        static let HTTPHeader: String = "Accept"
        static let json: String = "application/json"
        static let URL_BASE: String = "https://api.themoviedb.org/3"
        static let API_KEY: String = "api_key=48d320f802be4b92c89f20bf3b11f7f7"
        
        //https://api.themoviedb.org/3/search/movie?api_key=48d320f802be4b92c89f20bf3b11f7f7&query=el
        //https://api.themoviedb.org/3/movie/<movie-id>?api_key=<APIKEY>
    }
    
    // MARK: - Variables

    var path: String {
        switch self {
        case .getMovieList(let query):
            return "/search/movie?\(Constants.API_KEY)&query=\(query)"
        case .getMovieDetail(let id):
            return "/movie/\(id)?\(Constants.API_KEY)"
        }
    }
    
    // MARK: - HTTPMethods
    var method: ServiceMethods {
        return .GET
    }
    
    // MARK: - Parameters
    var parameters: [String: Any]? {
        switch self {
        default:
            return [String: Any]()
        }
    }
    
    // MARK: - Request
    var request: URLRequest? {
        guard let url = URL(string: "\(Constants.URL_BASE)\(path)") else { return nil }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.timeoutInterval = Constants.timeout
        request.setValue(Constants.json, forHTTPHeaderField: Constants.HTTPHeader)
    
        return request
    }
}

