//
//  Logs.swift
//  Peliculas
//
//  Created by Sara Francisco on 27/12/21.
//

import Foundation

internal enum LogType: String {
    case action
    case canceled
    case info
    case error
    case success
    case warning
}

internal final class Logs {
    
    // MARK: - Lifecycle Methods
    private init() {}
    
    // MARK: - Internal Methods
    static func message(_ message: String, type: LogType) {
            switch type {
            case .action:
                debugPrint("🔵 Action: \(message)")
            case .canceled:
                debugPrint("⚫ Cancelled: \(message)")
            case .error:
                debugPrint("🔴 Error: \(message)")
            case .info:
                debugPrint("🟡 Info: \(message)")
            case .success:
                debugPrint("🟢 Success: \(message)")
            case .warning:
                debugPrint("🟠 Warning: \(message)")
        }
    }
}

