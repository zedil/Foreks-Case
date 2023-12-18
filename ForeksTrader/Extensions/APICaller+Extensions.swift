//
//  APICaller+Extensions.swift
//  ForeksTrader
//
//  Created by Dilara Şimşek on 18.12.2023.
//

import Foundation

extension APICaller {
    
    func combineStrings(_ strings: [String]) -> String {
        let combinedString = strings.joined(separator: "~")
        
        return combinedString
    }
}
