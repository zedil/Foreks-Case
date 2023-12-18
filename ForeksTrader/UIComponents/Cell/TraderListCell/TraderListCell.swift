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
    
    public let horizontalStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 15
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
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
        addSubview(horizontalStackView)
        
        horizontalStackView.addArrangedSubview(stockTitleView)
        horizontalStackView.addArrangedSubview(lastLabel)
        horizontalStackView.addArrangedSubview(differenceLabel)
    }
    
    private func applyConstraints() {
        let stackViewConst = [
            horizontalStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 4),
            horizontalStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            horizontalStackView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ]
        NSLayoutConstraint.activate(stackViewConst)
    }
}

// MARK: - Configure
extension TraderListCell {
    
    private func configureContent() {
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
