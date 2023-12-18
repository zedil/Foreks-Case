//
//  TraderListCellModel.swift
//  ForeksTrader
//
//  Created by Dilara Şimşek on 16.12.2023.
//

public protocol TraderListCellDataSource: AnyObject {
    var title: String? { get }
    var subTitle: String? { get }
    var lastAmount: String? { get }
    var diffRate: String? { get }
    var isRateNegative: Bool? { get }
}

public protocol TraderListCellEventSource: AnyObject {
    
}

public protocol TraderListCellProtocol: TraderListCellDataSource, TraderListCellEventSource {}

public final class TraderListCellModel: TraderListCellProtocol {
    public var title: String?
    public var subTitle: String?
    public var lastAmount: String?
    public var diffRate: String?
    public var isRateNegative: Bool?
    
    public init(title: String? = nil, 
                subTitle: String? = nil,
                lastAmount: String? = nil,
                diffRate: String? = nil,
                isRateNegative: Bool? = nil) {
        self.title = title
        self.subTitle = subTitle
        self.lastAmount = lastAmount
        self.diffRate = diffRate
        self.isRateNegative = isRateNegative
    }
}
