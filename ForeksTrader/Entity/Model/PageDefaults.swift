//
//  PageDefaults.swift
//  ForeksTrader
//
//  Created by Dilara Şimşek on 17.12.2023.
//

import Foundation

struct PageDefaults: Codable {
    let mypageDefaults: [MyPageDefaults]
    let mypage: [MyPage]
}

struct MyPageDefaults: Codable {
    let cod: String
    let gro: String
    let tke: String
    let def: String
}

struct MyPage: Codable {
    let name: String
    let key: String
}


