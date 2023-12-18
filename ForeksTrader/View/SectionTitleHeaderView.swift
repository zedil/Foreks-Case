//
//  SectionTitleHeaderView.swift
//  ForeksTrader
//
//  Created by Dilara Şimşek on 16.12.2023.
//

import UIKit

class SectionTitleHeaderView: UICollectionReusableView {
    
    public let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public let lastButton: UIButton = {
        let button = UIButton()
        button.setTitle("Son", for: .normal)
        button.contentEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.gray, for: .normal)
        return button
    }()
    
    public let diffButton: UIButton = {
        let button = UIButton()
        button.setTitle("% Fark", for: .normal)
        button.contentEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.gray, for: .normal)
        return button
    }()
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        configureContent()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        addSubview(titleLabel)
        addSubview(lastButton)
        addSubview(diffButton)
        
        let titleLabelConst = [
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 4),
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 4),
        ]
        NSLayoutConstraint.activate(titleLabelConst)
        
        let diffButtonConst = [
            diffButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25),
            diffButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 4),
            diffButton.heightAnchor.constraint(equalToConstant: 20)
        ]
        NSLayoutConstraint.activate(diffButtonConst)
        
        diffButton.layer.borderWidth = 2
        diffButton.layer.borderColor = UIColor.gray.cgColor
        diffButton.layer.cornerRadius = 5
        
        let lastButtonConst = [
            lastButton.trailingAnchor.constraint(equalTo: diffButton.leadingAnchor, constant: -10),
            lastButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 4),
            lastButton.heightAnchor.constraint(equalToConstant: 20)
        ]
        NSLayoutConstraint.activate(lastButtonConst)
        
        lastButton.layer.borderWidth = 2
        lastButton.layer.borderColor = UIColor.gray.cgColor
        lastButton.layer.cornerRadius = 5
        
        
        lastButton.showsMenuAsPrimaryAction = true
        lastButton.menu = setMoreButton()
        
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
    
    
    @objc func diffButtonAction() {
        print("tapped")
    }
    
    private func configureContent() {
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
    }
}


