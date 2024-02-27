//
//  PrepareViewController.swift
//  SweaTy
//
//  Created by 이대현 on 2/26/24.
//

import SnapKit
import UIKit

protocol PrepareViewControllerDelegate: AnyObject {
    func moveExercisingView()
}

final class PrepareViewController: UIViewController {
    private lazy var mainScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .systemBackground
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray5
        return view
    }()
    
    private lazy var prepareGuideTitle: UILabel = {
        let label = UILabel()
        label.text = "SweaTy\n운동 환경 세팅 가이드"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .center
        label.numberOfLines = 2
        return label
    }()
    
    private lazy var startButton: UIButton = {
        var config = UIButton.Configuration.filled()
        config.background.backgroundColor = .sweatyGreen
        config.baseForegroundColor = .black
        var titleContainer = AttributeContainer()
        titleContainer.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        config.attributedTitle = AttributedString("시작하기", attributes: titleContainer)
        let button = UIButton()
        button.configuration = config
        button.addAction(UIAction { [weak self] _ in
            self?.delegate?.moveExercisingView()
        }, for: .touchUpInside)
        return button
    }()
    
    weak var delegate: PrepareViewControllerDelegate? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        self.setupUI()
    }
    
    private func setupUI() {
        view.addSubview(mainScrollView)
        mainScrollView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        mainScrollView.addSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.edges.equalTo(mainScrollView.contentLayoutGuide)
            make.height.greaterThanOrEqualTo(view.snp.height).priority(.low)
            make.width.equalTo(mainScrollView.snp.width)
        }
        
        contentView.addSubview(prepareGuideTitle)
        prepareGuideTitle.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
        }
        
        contentView.addSubview(startButton)
        startButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(1000)
            make.left.right.equalTo(prepareGuideTitle)
            make.height.equalTo(60)
            make.bottom.equalToSuperview().offset(-20)
        }
    }
}
