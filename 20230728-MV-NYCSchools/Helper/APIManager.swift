//
//  APIManager.swift
//  20230728-MV-NYCSchools
//
//  Created by Mani V on 7/28/23.
//

import Foundation
import UIKit

enum DataErrror: Error {
    
    case invalidResponse
    case invalidUrl
    case invalidDecoding
    case invalidData
    case network(_ error: Error?)
}

typealias ResultHandler = (Result<[School], DataErrror>) -> Void

class APIManager {
    
    static let shared = APIManager()
    private init() { }
    
    func fetchSchools(completion: @escaping ResultHandler) {
        
        guard let url = URL(string: Constant.API.schoolUrl) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(.failure(.invalidData))
                return
            }
            guard let response = response as? HTTPURLResponse, 200...299 ~= response.statusCode else {
                completion(.failure(.invalidResponse))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let schools = try decoder.decode([School].self, from: data)
                completion(.success(schools))
            } catch {
                completion(.failure(.network(error)))
            }
        }.resume()
    }
}
