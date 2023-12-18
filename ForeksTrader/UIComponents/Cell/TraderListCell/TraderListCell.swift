//
//  TraderListCell.swift
//  ForeksTrader
//
//  Created by Dilara Şimşek on 16.12.2023.
//

import UIKit

class TraderListCell: UICollectionViewCell {
    
    private var stockTitleView = StockView()
    
    static let identifier = "TraderListCell"
    
    public let lastLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public let differenceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    weak var viewModel: TraderListCellProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        applyConstraints()
        configureContent()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - UILayout
extension TraderListCell {
    
    private func addSubviews() {
        addSubview(stockTitleView)
        addSubview(lastLabel)
        addSubview(differenceLabel)
        
    }
    
    private func applyConstraints() {
        let stockTitleViewConst = [
            stockTitleView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            stockTitleView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 4),
            stockTitleView.heightAnchor.constraint(equalToConstant: 45),
            stockTitleView.widthAnchor.constraint(equalToConstant: 60)
        ]
        NSLayoutConstraint.activate(stockTitleViewConst)
        
        
        let diffLabelConst = [
            differenceLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -4),
            differenceLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ]
        NSLayoutConstraint.activate(diffLabelConst)
        
        
        let lastLabelConst = [
            lastLabel.trailingAnchor.constraint(equalTo: differenceLabel.trailingAnchor, constant: -80),
            lastLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ]
        NSLayoutConstraint.activate(lastLabelConst)
        
    }
}

// MARK: - Configure
extension TraderListCell {
    
    func configureContent() {
        backgroundColor = .black
        translatesAutoresizingMaskIntoConstraints = false
    }
}

// MARK: - SetViewModel
extension TraderListCell {
    
    func set(viewModel: TraderListCellProtocol) {
        self.viewModel = viewModel
        
        if let lastAmount = viewModel.lastAmount {
            lastLabel.text =  String(lastAmount)
        }
        
        if let diffRate = viewModel.diffRate {
            differenceLabel.text =  String(diffRate)
        }
        
        if let stockTitle = viewModel.title {
            stockTitleView.titleText = stockTitle
        }
        
        if let stockSubTitle = viewModel.subTitle {
            stockTitleView.subtitleText = stockSubTitle
        }
        
        if let isRateNegative = viewModel.isRateNegative {
            differenceLabel.textColor = isRateNegative ? UIColor.red : UIColor.green
        }
    }
}
