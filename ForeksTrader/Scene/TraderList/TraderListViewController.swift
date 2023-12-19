//
//  TraderListViewController.swift
//  ForeksTrader
//
//  Created by Dilara Şimşek on 16.12.2023.
//

import UIKit

class TraderListViewController: UIViewController {
    
    private var viewModel = TraderListViewModel()
    
    private let listCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: 150)
        layout.minimumInteritemSpacing = 0
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = .black
        collection.register(TraderListCell.self, forCellWithReuseIdentifier: TraderListCell.identifier)
        
        collection.register(SectionTitleHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionTitleHeaderView.identifier)
        return collection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        applyConstraints()
        configureContents()
        subscribeViewModel()
        viewModel.getData(leftField: "las", completion: {
            print("HERE I AM AND I DON'T KNOW WHAT TO DO WITH THIS COMPLETION")
        })
    }
}

// MARK: - UILayout
extension TraderListViewController {
    
    private func addSubviews() {
        view.addSubview(listCollectionView)
    }
    
    private func applyConstraints() {
        let collectionViewConst = [
            listCollectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            listCollectionView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            listCollectionView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height),
            listCollectionView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width)
        ]
        NSLayoutConstraint.activate(collectionViewConst)
    }
}

// MARK: - Configure
extension TraderListViewController {
    
    private func configureContents() {
        view.backgroundColor = .black
        setDelegates()
    }
    
    private func setDelegates() {
        listCollectionView.delegate = self
        listCollectionView.dataSource = self
    }
    
}

// MARK: - SubscribeViewModel
extension TraderListViewController {
    
    private func subscribeViewModel() {
        viewModel.reloadData = { [weak self] in
            guard let self else { return }
            DispatchQueue.main.async {
                self.listCollectionView.reloadData()
            }
        }
    }
}


// MARK: - UICollectionViewDataSource
extension TraderListViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItemsAt(section: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TraderListCell.identifier, for: indexPath) as? TraderListCell else {
            return UICollectionViewCell()
        }
        let cellItem = viewModel.cellItemAt(indexPath: indexPath)
        
        cell.set(viewModel: cellItem)
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension TraderListViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = collectionView.frame.width
        return .init(width: cellWidth, height: 85)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionView.elementKindSectionHeader {
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionTitleHeaderView.identifier, for: indexPath) as! SectionTitleHeaderView
            
            headerView.dataArray = viewModel.menuArray
            
            if let menu = headerView.getLeftMenu() {
                headerView.leftButton.menu = menu
                headerView.leftButton.showsMenuAsPrimaryAction = true
            }
            
            headerView.leftButtonTapClosure = { [weak self] field in
                guard let self else { return }
                self.viewModel.getData(leftField: field) {
                    DispatchQueue.main.async {
                        self.listCollectionView.reloadData()
                    }
                }
            }
            
            return headerView
        }
        
        return UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 50)
    }
}

