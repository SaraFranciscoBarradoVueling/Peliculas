//
//  WebServices.swift
//  Peliculas
//
//  Created by Sara Francisco on 27/12/21.
//

import Foundation

internal final class WebService {
    
    // MARK: - Internal Methods
    static func request<T>(route: ServiceRoutes,
                           responseModel: T.Type,
                           completed: @escaping(Result<T, ServiceError>) -> ()) where T: Decodable {
        
        guard let request = route.request else {
            completed(.failure(.badRequest))
            return
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                if let _ = error {
                    completed(.failure(.unexpected))
                    return
                }
                
                guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                    completed(.failure(.unparseable))
                    return
                }
                
                guard let data = data else {
                    completed(.failure(.noContent))
                    return
                }
                
                do {
                    Logs.message("ApiController | Route: \(route) | Response: \(data)", type: .success)
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .useDefaultKeys
                    let response = try decoder.decode(T.self, from: data)
                    completed(.success(response))
                } catch {
                    completed(.failure(.mappingFailed))
                }
            }
        }.resume()
    }
    
}

