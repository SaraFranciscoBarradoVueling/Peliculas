//
//  ServiceConfigurationProtocol.swift
//  Peliculas
//
//  Created by Sara Francisco on 27/12/21.
//

import Foundation

internal protocol ServiceConfigurationProtocol {
    var id: String { get }
    var path: String { get }
    var method: ServiceMethods { get }
    var request: URLRequest? { get }
    var parameters: [String: Any]? { get }
}
