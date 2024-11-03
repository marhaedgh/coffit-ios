//
//  DetailViewController.swift
//  Coffit
//
//  Created by danna.x-PC on 10/21/24.
//

import UIKit
import SnapKit
import MarkdownKit

class DetailViewController: UIViewController {
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.numberOfLines = 0
        return label
    }()
    
    private let textView: UITextView = {
        let textView = UITextView()
        textView.isEditable = false
        textView.font = UIFont.systemFont(ofSize: 16)
        return textView
    }()
    
    private let markdownParser = MarkdownParser()
    
    init(title: String, markdownContent: String) {
        super.init(nibName: nil, bundle: nil)
        titleLabel.text = title
        setupMarkdownContent(markdownContent)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(titleLabel)
        view.addSubview(textView)
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        textView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(20)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-20)
        }
    }
    
    private func setupMarkdownContent(_ content: String) {
        let attributedString = markdownParser.parse(content)
        textView.attributedText = attributedString
        textView.textColor = .label
    }
}
