//
//  APICaller.swift
//  ForeksTrader
//
//  Created by Dilara Şimşek on 17.12.2023.
//

import Foundation

enum APIError: Error {
    case failed
}

class APICaller {
    
    static let shared = APICaller()
    
    func getPageDefaults(completion: @escaping (Result<[PageDefaults], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseUrl + Constants.url)") else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let result = try JSONDecoder().decode(PageDefaults.self, from: data)
                completion(.success([result]))
            } catch {
                completion(.failure(APIError.failed))
            }
        }
        task.resume()
    }
    
    func fetchStockData(stcs: [String], completion: @escaping (Result<[StockDetailModel], Error>) -> Void) {
        
        let joinedString = combineStrings(stcs)
        
        guard let url = URL(string: "\(Constants.baseUrl + Constants.getData + joinedString)") else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let result = try JSONDecoder().decode(StockDetailModel.self, from: data)
                completion(.success([result]))
            } catch {
                completion(.failure(APIError.failed))
            }
        }
        task.resume()
    }
}
