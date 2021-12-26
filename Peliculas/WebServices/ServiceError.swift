//
//  ServiceError.swift
//  Peliculas
//
//  Created by Sara Francisco on 26/12/21.
//

import Foundation

enum ServiceError: LocalizedError {
    
    case apiError(message: String)
    case realmObjectNotFound
    case parseError
    case mappingFailed
    case unexpected
    case unparseable
    case badRequest
    case internalServer
    case unknown(error: NSError)
    case timedOut
    case connectionLost
    case noContent
    
    public var errorDescription: String? {
        switch self {
        case .realmObjectNotFound:
            return "Error managing transactions in Realm"
        case .parseError:
            return "Error parsing data"
        case .apiError(let message):
            return message
        case .mappingFailed:
            return "Could not decode response as desired type"
        case .unexpected:
            return "An error has occurred"
        case .unparseable:
            return "Server response could not be parsed"
        case .badRequest:
            return "The connection failed due to a malformed URL"
        case .internalServer:
            return "The connection received an invalid server response"
        case .unknown(let error):
            return error.localizedDescription
        case .timedOut:
            return "The connection timed out"
        case .connectionLost:
            return "The connection failed because the network connection was lost"
        case .noContent:
            return "The response retrieved by the connection is zero bytes"
        }
    }
    
    static func mapServiceError(error: NSError) -> ServiceError {
        
        switch error.code {
        case 000:
            return .unexpected
        case 303:
            return .unparseable
        case 400, -1000:
            return .badRequest
        case 500, -1011:
            return .internalServer
        case -998:
            return .unknown(error: error)
        case -1001:
            return .timedOut
        case -1005:
            return .connectionLost
        case -1014:
            return .noContent
        default:
            return .unknown(error: error)
        }
    }
}
