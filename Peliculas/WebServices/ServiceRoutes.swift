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
    case getImagesBaseUrl
}
extension ServiceRoutes: ServiceConfigurationProtocol {
    
    // MARK: - Constants
    private enum Constants {
        static let timeout: TimeInterval = 30
        static let HTTPHeader: String = "Accept"
        static let json: String = "application/json"
        static let URL_BASE: String = "https://api.themoviedb.org/3"
        static let API_KEY: String = "api_key=48d320f802be4b92c89f20bf3b11f7f7"
        //listado
        //https://api.themoviedb.org/3/search/movie?api_key=48d320f802be4b92c89f20bf3b11f7f7&query=el
        //detalle
        //https://api.themoviedb.org/3/movie/1362?api_key=48d320f802be4b92c89f20bf3b11f7f7
        //base url de las imagenes
        //https://api.themoviedb.org/3/configuration?api_key=48d320f802be4b92c89f20bf3b11f7f7
        // para la imagen llamas a configuration para conseguir base_url+file_size+file_path+poster_path(este ultimo se saca del listado)
    }
    
    // MARK: - Variables

    var path: String {
        switch self {
        case .getImagesBaseUrl:
            return "/configuration?\(Constants.API_KEY)"
        case .getMovieList(let query):
            if let queryFormat = query.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed){
                return "/search/movie?\(Constants.API_KEY)&query=%22\(queryFormat.description)%22"
            } else {
                return ""
            }
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

