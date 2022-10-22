//
//  Errors.swift
//  NewsApp
//
//  Created by Sana Kavser  on 21/10/22.
//

import Foundation

enum AppError: Error, LocalizedError {
    case networkError
    case wrap(error: Error)
    case jsonParseError
    case unknown
    
    var errorDescription: String? {
        switch self {
        case .networkError:
            return "Couldn't Connect to network"
        case let .wrap(error):
            return error.localizedDescription
        default:
            return "Something went wrong"
        }
    }
    
}
