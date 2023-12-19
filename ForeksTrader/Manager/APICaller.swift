//
//  APICaller.swift
//  ForeksTrader
//
//  Created by Dilara Şimşek on 17.12.2023.
//

import Foundation

class APICaller {
    
    static let shared = APICaller()
    
    func getPageDefaults(completion: @escaping (Result<[PageDefaultsData], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseUrl + Constants.url)") else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let result = try JSONDecoder().decode(PageDefaultsData.self, from: data)
                completion(.success([result]))
            } catch {
                completion(.failure(APIError.failed))
            }
        }
        task.resume()
    }
    
    func fetchStockData(leftField: String, stcs: [String], completion: @escaping (Result<[StockDetailData], Error>) -> Void) {
        
        let joinedString = combineStrings(stcs)
        
        guard let url = URL(string: "\(Constants.baseUrl + Constants.stockDetailUrl + leftField + "," + Constants.finalDetailUrl + joinedString)") else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let result = try JSONDecoder().decode(StockDetailData.self, from: data)
                completion(.success([result]))
            } catch {
                completion(.failure(APIError.failed))
            }
        }
        task.resume()
    }
}

// MARK: - Enum
extension APICaller {
    
    enum APIError: Error {
        case failed
    }
}
