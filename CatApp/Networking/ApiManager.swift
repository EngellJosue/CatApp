//
//  ApiManager.swift
//  CatApp
//
//  Created by User-M02 on 4/23/23.
//

import Foundation

final class ApiManger {
    static let shared = ApiManger()
    
    private init () {}
    
    func fetch<T: Decodable>(_ type: T.Type, url: String, completion: @escaping (Result<T, ApiError>) -> Void) {
        guard let url = URL(string: url) else {
            completion(Result.failure(.badUrl))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error as? URLError {
                completion(Result.failure(.url(error)))
                return
            }
            
            if let response = response as? HTTPURLResponse, response.statusCode != 200 {
                completion(Result.failure(.badResponse(statusCode: response.statusCode)))
                return
            }
            
            if let data = data {
                let decoder = JSONDecoder()
                
                do {
                    let result = try decoder.decode(type, from: data)
                    completion(Result.success(result))
                }
                catch {
                    completion(Result.failure(.parsing(error as? DecodingError)))
                }
            }
        }
        
        task.resume()
    }
}
