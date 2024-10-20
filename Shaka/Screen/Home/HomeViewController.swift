//
//  HomeViewController.swift
//  Shaka
//
//  Created by danna.x-PC on 10/20/24.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    
    private lazy var collectionView: UICollectionView = setCollectionView()
    
    private var items: [HomeItem] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fetchItems()
    }
}

extension HomeViewController {
    private func setupUI() {
        view.backgroundColor = .systemBackground
        
        navigationItem.title = "내 정보 모음"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func setCollectionView() -> UICollectionView {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemBackground
        collectionView.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: HomeCollectionViewCell.reuseIdentifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        return collectionView
    }
    
    private func fetchItems() {
        // TODO: Implement API call to fetch items
        items = [
            HomeItem(title: "제목 1", summary: "한 줄 정리 1", keywords: ["키워드1", "키워드2"], date: Date(), isRead: false, content: Mock.markdown()),
            HomeItem(title: "제목 2", summary: "한 줄 정리 2", keywords: ["키워드3", "키워드4"], date: Date().addingTimeInterval(-86400), isRead: true, content: Mock.markdown()),
        ]
        collectionView.reloadData()
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.reuseIdentifier, for: indexPath) as? HomeCollectionViewCell else {
            fatalError("Failed to dequeue HomeCollectionViewCell")
        }
        
        let item = items[indexPath.item]
        cell.configure(with: item)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 100) // Adjust height as needed
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = items[indexPath.item]
        let detailVC = DetailViewController(title: item.title, markdownContent: item.content)
        detailVC.modalPresentationStyle = .pageSheet
        if let sheet = detailVC.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
            sheet.prefersGrabberVisible = true
            sheet.selectedDetentIdentifier = .medium
            
            //뒤 배경 흐리게 제거 (기본 값은 모든 크기에서 배경 흐리게 됨)
            //sheet.largestUndimmedDetentIdentifier = .medium
        }
        present(detailVC, animated: true)
        
        // 읽음 표시 업데이트
        items[indexPath.item].isRead = true
        collectionView.reloadItems(at: [indexPath])
    }
}
