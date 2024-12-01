//
//  WebViewController.swift
//  Coffit
//
//  Created by danna.x-PC on 11/6/24.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    private var urlString: String = ""
    
    private lazy var webView: WKWebView = { createWebView() }()
    
    init(urlString: String) {
        super.init(nibName: nil, bundle: nil)
        self.urlString = urlString
        print("WebView url: \(urlString)")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLayout()
    }
    
    private func createWebView() -> WKWebView {
        let webView = WKWebView()
        let request = URLRequest(url: URL(string: urlString)!)
        webView.load(request)
        view.addSubview(webView)
        return webView
    }
    
    private func setLayout() {
        webView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
