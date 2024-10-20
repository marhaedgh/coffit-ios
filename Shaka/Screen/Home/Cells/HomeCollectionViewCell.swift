//
//  HomeCollectionViewCell.swift
//  Shaka
//
//  Created by danna.x-PC on 10/20/24.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = String(describing: HomeCollectionViewCell.self)
    
    private let horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .top
        stackView.spacing = 8
        return stackView
    }()
    
    private let verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 4
        return stackView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.numberOfLines = 1
        return label
    }()
    
    private let summaryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 2
        return label
    }()
    
    private let keywordsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .systemBlue
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .secondaryLabel
        return label
    }()
    
    private let readIndicator: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBlue
        view.layer.cornerRadius = 4
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        contentView.addSubview(horizontalStackView)
        horizontalStackView.addArrangedSubview(verticalStackView)
        horizontalStackView.addArrangedSubview(dateLabel)
        
        verticalStackView.addArrangedSubview(titleLabel)
        verticalStackView.addArrangedSubview(summaryLabel)
        verticalStackView.addArrangedSubview(keywordsLabel)
        
        contentView.addSubview(readIndicator)
        
        horizontalStackView.snp.makeConstraints { make in
            make.verticalEdges.equalToSuperview().inset(16)
            make.horizontalEdges.equalToSuperview().inset(20)
        }
        
        dateLabel.setContentHuggingPriority(.required, for: .horizontal)
        
        readIndicator.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().inset(8)
            make.width.height.equalTo(8)
        }
    }
    
    func configure(with item: HomeItem) {
        titleLabel.text = item.title
        summaryLabel.text = item.summary
        keywordsLabel.text = item.keywords.joined(separator: " • ")
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM.dd"
        dateLabel.text = dateFormatter.string(from: item.date)
        
        readIndicator.isHidden = item.isRead
    }
}
