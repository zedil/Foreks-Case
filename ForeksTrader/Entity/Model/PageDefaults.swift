//
//  PageDefaults.swift
//  ForeksTrader
//
//  Created by Dilara Şimşek on 17.12.2023.
//

import Foundation

struct PageDefaults: Codable {
    let mypageDefaults: [MyPageDefaults]
}

struct MyPageDefaults: Codable {
    let cod: String
    let gro: String
    let tke: String
    let def: String
}
