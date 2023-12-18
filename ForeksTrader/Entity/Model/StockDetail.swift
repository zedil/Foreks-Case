//
//  StockDetail.swift
//  ForeksTrader
//
//  Created by Dilara Şimşek on 17.12.2023.
//

struct StockDetailModel: Codable {
    let l: [StockDetail]
}

struct StockDetail: Codable {
    let tke: String?
    let clo: String?
    let pdd: String?
    let las: String?
}
