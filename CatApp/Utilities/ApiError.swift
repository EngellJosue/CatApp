//
//  ApiError.swift
//  CatApp
//
//  Created by User-M02 on 4/23/23.
//

import Foundation

enum ApiError: Error, CustomStringConvertible {
    case badUrl
    case badResponse(statusCode: Int)
    case url(URLError?)
    case parsing(DecodingError?)
    case unknown
    
    var description: String {
        switch self {
        case .badUrl: return "Invalid url"
        case .unknown: return "Unknown error"
        case .url(let error):
            return error?.localizedDescription ?? "URL session error"
        case .parsing(let error):
            return "Parsing error: \(error?.localizedDescription ?? "Unknown parsing error")"
        case .badResponse(let statuscode):
            return "Bad response with \(statuscode) code"
        }
    }
}
