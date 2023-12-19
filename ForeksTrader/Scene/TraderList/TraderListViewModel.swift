//
//  TraderListViewModel.swift
//  ForeksTrader
//
//  Created by Dilara Şimşek on 16.12.2023.
//

import Foundation

protocol TraderListViewDataSource {
    func numberOfItemsAt(section: Int) -> Int
    func cellItemAt(indexPath: IndexPath) -> TraderListCellProtocol
}

protocol TraderListViewEventSource {
    var reloadData: (()->Void)? { get set }
}

protocol TraderListViewProtocol: TraderListViewDataSource, TraderListViewEventSource {
    
}

final class TraderListViewModel: TraderListViewProtocol {
    var tkeArray: [String] = []
    var cellItems: [TraderListCellProtocol] = []
    var pageDefaultList: [MyPageDefaults]? = nil
    var reloadData: (() -> Void)?
    
    var menuArray: [MyPage] = []
}

// MARK: - Request
extension TraderListViewModel {
    
    public func getData(leftField: String, completion: @escaping () -> Void) {
        APICaller.shared.getPageDefaults { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let success):
                
                menuArray = success.first?.mypage ?? []
                tkeArray = success.first?.mypageDefaults.map({ $0.tke }) ?? []
                
                getStockDetail(field: leftField, stc: tkeArray)
                completion()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func getStockDetail(field: String, stc: [String]) {
        APICaller.shared.fetchStockData(leftField: field, stcs: stc) { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let success):
                let list = success.first!.l.map({ TraderListCellModel(stockDetail: $0) })
                
                self.cellItems = list
                self.reloadData?()
            case .failure(let error):
                print(error)
            }
        }
    }
}

// MARK: - DataSource
extension TraderListViewModel {
    
    func numberOfItemsAt(section: Int) -> Int {
        return cellItems.count
    }
    
    func cellItemAt(indexPath: IndexPath) -> TraderListCellProtocol {
        return cellItems[indexPath.row]
    }
}

// MARK: - Actions
extension TraderListViewModel {
    
    func rateTapped() {
        
    }
}
