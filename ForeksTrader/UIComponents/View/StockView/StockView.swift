//
//  StockView.swift
//  ForeksTrader
//
//  Created by Dilara Şimşek on 16.12.2023.
//

import UIKit

public class StockView: UIView {
    
    let imageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "star.fill")
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var subtitleLabel: UILabel = {
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
        addSubview(titleLabel)
        addSubview(subtitleLabel)
    }
    
    private func applyConstraints() {
        let imageViewConst = [
            imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
        ]
        NSLayoutConstraint.activate(imageViewConst)
        
        let titleLabelConst = [
            titleLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 4),
            titleLabel.topAnchor.constraint(equalTo: imageView.topAnchor),
        ]
        NSLayoutConstraint.activate(titleLabelConst)
        
        let subtitleConst = [
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            subtitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            subtitleLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor)
        ]
        NSLayoutConstraint.activate(subtitleConst)
        
        self.heightAnchor.constraint(equalToConstant: 150).isActive = true
    }
}

// MARK: - Configure
extension StockView {
    
    private func configureContent() {
        translatesAutoresizingMaskIntoConstraints = false
    }
}


