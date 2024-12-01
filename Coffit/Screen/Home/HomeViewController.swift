//
//  HomeViewController.swift
//  Coffit
//
//  Created by danna.x-PC on 10/20/24.
//

import UIKit
import SnapKit
import Moya

class HomeViewController: UIViewController {
    
    private lazy var collectionView: UICollectionView = setCollectionView()
    
    private var items: [HomeItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fetchItems()
//        fetchMockItems()
    }
}

extension HomeViewController {
    private func setupUI() {
        view.backgroundColor = .systemBackground
        
        navigationItem.title = "My Coffit ☕️"
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
        let provider = MoyaProvider<NotificationAPI>()
        
        provider.request(.getNotifications(request: GetNotificationsRequest(
            userId: UserDefaults.getUserId(),
            businessDataId: UserDefaults.getBusinessId()
        ))) { (result) in
            switch result {
            case .success(let response):
                do {
                    let baseResponse = try response.map(BaseResponse<[GetNotificationsResponse]>.self)
                    
                    if let notifications = baseResponse.data {
                        self.items = notifications.map { item in
                            HomeItem(
                                id: item.id,
                                title: item.title,
                                summary: item.lineSummary,
                                keywords: item.keywords ?? [],
//                                date: item.date.toDate()!,
                                date: Date.now,
                                isRead: item.isRead
                            )
                        }
                        self.items.append(contentsOf: Mock.homeItem())
                        self.collectionView.reloadData()
                    }
                } catch {
                    print("Decoding error: \(error)")
                }
            case .failure(let error):
                print("Network error: \(error)")
            }
            
        }
    }
    
    private func fetchMockItems() {
        items = Mock.homeItem()
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
        return CGSize(width: collectionView.bounds.width, height: 110) // Adjust height as needed
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = items[indexPath.item]
        let notificationId = item.id
        
        let detailVC = WebViewController(
            urlString: "\(Bundle.chatBaseURL)/?alert_id=\(notificationId)"
        )
        
        detailVC.modalPresentationStyle = .pageSheet
        
        if let sheet = detailVC.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
            sheet.prefersGrabberVisible = true
            sheet.selectedDetentIdentifier = .large
        }
        present(detailVC, animated: true)
        
        // 읽음 표시 업데이트
        items[indexPath.item].isRead = true // TODO: API 연결
        collectionView.reloadItems(at: [indexPath])
    }
}
