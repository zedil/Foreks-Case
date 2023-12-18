//
//  SectionTitleHeaderView.swift
//  ForeksTrader
//
//  Created by Dilara Şimşek on 16.12.2023.
//

import UIKit

class SectionTitleHeaderView: UICollectionReusableView {
    
    static let identifier = "SectionTitleHeaderView"
    
    public let headerStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    public let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.text = "Sembol"
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public let lastButton: UIButton = {
        let button = UIButton()
        button.setTitle("Son", for: .normal)
        button.contentEdgeInsets = UIEdgeInsets(top: 1, left: 10, bottom: 1, right: 10)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.gray, for: .normal)
        return button
    }()
    
    public let diffButton: UIButton = {
        let button = UIButton()
        button.setTitle("% Fark", for: .normal)
        button.contentEdgeInsets = UIEdgeInsets(top: 1, left: 10, bottom: 1, right: 10)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.gray, for: .normal)
        return button
    }()
    
    override public init(frame: CGRect) {
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
        headerStackView.addArrangedSubview(lastButton)
        headerStackView.addArrangedSubview(diffButton)
    }
    
    func applyConstraint() {
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
    
    func configureContent() {
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
        configureLastButton()
        configureDiffButton()
    }
    
    func configureLastButton() {
        lastButton.showsMenuAsPrimaryAction = true
        lastButton.menu = setMoreButton()
        
        lastButton.layer.borderWidth = 2
        lastButton.layer.borderColor = UIColor.gray.cgColor
        lastButton.layer.cornerRadius = 5
    }
    
    func configureDiffButton() {
        diffButton.layer.borderWidth = 2
        diffButton.layer.borderColor = UIColor.gray.cgColor
        diffButton.layer.cornerRadius = 5
        
        diffButton.addTarget(self, action: #selector(diffButtonAction), for: .touchUpInside)
    }
    
    func setMoreButton() -> UIMenu {
        let menuItems = UIMenu(title: "Kriter Seçiniz", options: .displayInline, children: [
            
            UIAction(title: "Son", handler: { (_) in
                print("Son")
            }),
            UIAction(title: "%Fark", handler: { (_) in
                print("Fark")
            }),
            UIAction(title: "Fark", handler: { (_) in
                print("Fark")
            }),
            UIAction(title: "Düşük", handler: { (_) in
                print("Düşük")
            }),
            UIAction(title: "Yüksek", handler: { (_) in
                print("Yüksek")
            })
        ])
        return menuItems
    }
}

// MARK: - Actions
extension SectionTitleHeaderView {
    
    @objc func diffButtonAction() {
        print("tapped")
    }
}

