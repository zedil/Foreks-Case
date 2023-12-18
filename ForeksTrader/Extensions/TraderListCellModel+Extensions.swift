//
//  TraderListCellModel+Extensions.swift
//  ForeksTrader
//
//  Created by Dilara Şimşek on 17.12.2023.
//

import UIKit

extension TraderListCellModel {
    
    convenience init(pageDefaults: MyPageDefaults) {
        self.init(title: pageDefaults.cod)
    }
    
    convenience init(stockDetail: StockDetail) {
        let rate = "%\(stockDetail.pdd ?? "")"
        var isRateNegative = true
        
        if let diffRate = stockDetail.pdd {
            isRateNegative = diffRate < "0,0"
        }
        
        self.init(title: stockDetail.tke,
                  subTitle: stockDetail.clo,
                  lastAmount: stockDetail.las,
                  diffRate: rate,
                  isRateNegative: isRateNegative)
    }
}
