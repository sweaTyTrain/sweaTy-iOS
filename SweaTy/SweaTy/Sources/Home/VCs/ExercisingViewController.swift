//
//  ExercisingViewController.swift
//  SweaTy
//
//  Created by 이대현 on 2/26/24.
//

import SnapKit
import UIKit
import WebKit

protocol ExercisingViewControllerDelegate: AnyObject {
    func moveResultView()
}

final class ExercisingViewController: UIViewController {
    private var webView = WKWebView()
    
    private lazy var finishButton: UIButton = {
        var config = UIButton.Configuration.filled()
        config.background.backgroundColor = .red
        config.baseForegroundColor = .white
        var titleContainer = AttributeContainer()
        titleContainer.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        config.attributedTitle = AttributedString("종료", attributes: titleContainer)
        let button = UIButton()
        button.configuration = config
        button.addAction(UIAction { [weak self] _ in
            self?.delegate?.moveResultView()
        }, for: .touchUpInside)
        return button
    }()
    
    weak var delegate: ExercisingViewControllerDelegate? = nil
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        self.webView = WKWebView(frame: .zero, configuration: webConfiguration)
        self.view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        self.setupUI()
        self.setupURL()
    }
    
    private func setupUI() {
//        view.addSubview(webView)
//        webView.snp.makeConstraints { make in
//            make.edges.equalTo(view.safeAreaLayoutGuide)
//        }
        
        view.addSubview(finishButton)
        finishButton.snp.makeConstraints { make in
            make.left.equalTo(view.safeAreaLayoutGuide).offset(30)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-30)
            make.height.equalTo(50)
            make.width.equalTo(100)
        }
    }
    
    private func setupURL() {
        if let url = URL(string: "https://www.apple.com") {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
}
