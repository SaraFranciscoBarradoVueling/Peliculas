//
//  ServiceRoutes.swift
//  Peliculas
//
//  Created by Sara Francisco on 27/12/21.
//

import Foundation

internal enum ServiceRoutes {
    case getRates
    case getTransactions
}
extension ServiceRoutes: ServiceConfigurationProtocol {
    
    // MARK: - Constants
    private enum Constants {
        static let timeout: TimeInterval = 30
        static let HTTPHeader: String = "Accept"
        static let json: String = "application/json"
        static let URL_BASE: String = "http://quiet-stone-2094.herokuapp.com"
    }
    
    // MARK: - Variables
    var path: String {
        switch self {
        case .getRates:
            return "/rates"
        case .getTransactions:
            return "/transactions"
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

