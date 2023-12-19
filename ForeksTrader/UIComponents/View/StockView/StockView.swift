//
//  StockView.swift
//  ForeksTrader
//
//  Created by Dilara Şimşek on 16.12.2023.
//

import UIKit

public class StockView: UIView {
    
    private let imageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "star.fill")
        image.tintColor = UIColor.green
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let titleSubtitleStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 2
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 10)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    public var titleText: String? {
        didSet {
            titleLabel.text = titleText
        }
    }
    
    public var subtitleText: String? {
        didSet {
            subtitleLabel.text = subtitleText
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
        applyConstraints()
        configureContent()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}

// MARK: - UILayout
extension StockView {
    
    private func addSubViews() {
        addSubview(imageView)
        addSubview(titleSubtitleStackView)
        
        titleSubtitleStackView.addArrangedSubview(titleLabel)
        titleSubtitleStackView.addArrangedSubview(subtitleLabel)
    }
    
    private func applyConstraints() {
        let imageViewConst = [
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ]
        NSLayoutConstraint.activate(imageViewConst)
        
        let stackViewConst = [
            titleSubtitleStackView.leadingAnchor.constraint(equalTo: self.imageView.trailingAnchor, constant: 5),
            titleSubtitleStackView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ]
        NSLayoutConstraint.activate(stackViewConst)
    }
}

// MARK: - Configure
extension StockView {
    
    private func configureContent() {
        translatesAutoresizingMaskIntoConstraints = false
    }
}

