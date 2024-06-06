//
//  NetworkManager.swift
//  MobileNativeTask
//
//  Created by kalyan chakravarthy on 05/06/24.
//

import Foundation

enum DataError: Error {
    case invalidData
    case invalidResponse
    case message(_ error: Error?)
}

class NetworkManager {
    static let shared = NetworkManager()
        
    private init() { }
    
    func fetchSearchData(completion: @escaping (Result<[UniversityViewModel], DataError>) -> Void) {
        guard let url = URL(string: API_SEARCH_LIST) else {
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data else {
                completion(.failure(.invalidData))
                return
            }
            guard let response = response else {
                completion(.failure(.invalidResponse))
                return
            }
            
            do {
                let products = try JSONDecoder().decode([UniversityViewModel].self, from: data)
                completion(.success(products))
            }
            catch {
                completion(.failure(.message(error)))
            }
        }.resume()
    }
    
}
