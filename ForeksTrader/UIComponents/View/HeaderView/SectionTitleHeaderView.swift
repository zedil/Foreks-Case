//
//  SectionTitleHeaderView.swift
//  ForeksTrader
//
//  Created by Dilara Şimşek on 16.12.2023.
//

import UIKit

class SectionTitleHeaderView: UICollectionReusableView {
    
    static let identifier = "SectionTitleHeaderView"
    
    var dataArray: [MyPage] = []
    
    private let headerStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.text = "Sembol"
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public let leftButton: UIButton = {
        let button = UIButton()
        button.setTitle("Son", for: .normal)
        button.contentEdgeInsets = UIEdgeInsets(top: 1, left: 10, bottom: 1, right: 10)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.gray, for: .normal)
        return button
    }()
    
    public let rightButton: UIButton = {
        let button = UIButton()
        button.setTitle("% Fark", for: .normal)
        button.contentEdgeInsets = UIEdgeInsets(top: 1, left: 10, bottom: 1, right: 10)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.gray, for: .normal)
        return button
    }()
    
    var leftButtonTapClosure: ((String) -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        applyConstraint()
        configureContent()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - UILayout
extension SectionTitleHeaderView {
    
    private func addSubviews() {
        addSubview(headerStackView)
        
        headerStackView.addArrangedSubview(titleLabel)
        headerStackView.addArrangedSubview(leftButton)
        headerStackView.addArrangedSubview(rightButton)
    }
    
    private func applyConstraint() {
        let stackViewConst = [
            headerStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            headerStackView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            headerStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        ]
        NSLayoutConstraint.activate(stackViewConst)
    }
}

// MARK: - Configure
extension SectionTitleHeaderView {
    
    private func configureContent() {
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
        configureLastButton()
        configureDiffButton()
    }
    
    private func configureLastButton() {
        leftButton.layer.borderWidth = 2
        leftButton.layer.borderColor = UIColor.gray.cgColor
        leftButton.layer.cornerRadius = 5
    }
    
    private func configureDiffButton() {
        rightButton.layer.borderWidth = 2
        rightButton.layer.borderColor = UIColor.gray.cgColor
        rightButton.layer.cornerRadius = 5
    }
    
    func getLeftMenu() -> UIMenu? {
        let menuActions: [UIAction] = dataArray.map { item in
            return UIAction(title: item.name) { _ in
                self.leftButton.setTitle(item.name, for: .normal)
                self.leftButtonTapClosure?(item.key)
            }
        }
        return UIMenu(title: "Kriter Seçiniz", children: menuActions)
    }
}


