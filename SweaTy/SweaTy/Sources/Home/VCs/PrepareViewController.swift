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
        label.font = .systemFont(ofSize: 32, weight: .bold)
        label.textAlignment = .center
        label.numberOfLines = 2
        return label
    }()
    
    private lazy var direction1Label: UILabel = {
        let label = UILabel()
        label.text = "1. 카메라를 가로로 눕혀주세요."
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .sweatyDarkGreen
        return label
    }()
    
    private lazy var direction1ImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "photo")
        return imageView
    }()
    
    private lazy var direction2Label: UILabel = {
        let label = UILabel()
        label.text = "2. 카메라는 정면을 바라보게 놓아주세요."
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .sweatyDarkGreen
        return label
    }()
    
    private lazy var direction2ImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "photo")
        return imageView
    }()
    
    private lazy var direction3Label: UILabel = {
        let label = UILabel()
        label.text = "3. 운동하기 좋은 높이와 각도"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .sweatyDarkGreen
        return label
    }()
    
    private lazy var direction3ImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "photo")
        return imageView
    }()
    
    private lazy var direction4Label: UILabel = {
        let label = UILabel()
        label.text = "4. 전신이 보이는 곳에서 운동하세요."
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .sweatyDarkGreen
        return label
    }()
    
    private lazy var direction4ImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "photo")
        return imageView
    }()
    
    private lazy var direction5Label: UILabel = {
        let label = UILabel()
        label.text = "5. 주변과 대비되는 색상을 입으세요."
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .sweatyDarkGreen
        return label
    }()
    
    private lazy var direction5ImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "photo")
        return imageView
    }()
    
    
    /*
     1. 카메라 세팅
     카메라를 가로로 눕혀주세요.
     2. 카메라 위치
     카메라는 정면을 바라보게 놓아주세요.
     3. 운동하기 좋은 높이와 각도
     적정 높이 : 85~95cm
     적정 각도 : 90도
     4. 전신이 보이는 곳에서 운동하세요.
     5. 주변과 대비되는 색상을 입으세요.
     */
    
    
    
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
        
        contentView.addSubview(direction1Label)
        direction1Label.snp.makeConstraints { make in
            make.top.equalTo(prepareGuideTitle.snp.bottom).offset(30)
            make.left.right.equalTo(prepareGuideTitle)
        }
        
        contentView.addSubview(direction1ImageView)
        direction1ImageView.snp.makeConstraints { make in
            make.top.equalTo(direction1Label.snp.bottom).offset(30)
            make.centerX.equalTo(direction1Label)
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(direction1ImageView.snp.width)
        }
        
        contentView.addSubview(direction2Label)
        direction2Label.snp.makeConstraints { make in
            make.top.equalTo(direction1ImageView.snp.bottom).offset(30)
            make.left.right.equalTo(direction1Label)
        }
        
        contentView.addSubview(direction2ImageView)
        direction2ImageView.snp.makeConstraints { make in
            make.top.equalTo(direction2Label.snp.bottom).offset(30)
            make.centerX.equalTo(direction2Label)
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(direction2ImageView.snp.width)
        }
        
        contentView.addSubview(direction3Label)
        direction3Label.snp.makeConstraints { make in
            make.top.equalTo(direction2ImageView.snp.bottom).offset(30)
            make.left.right.equalTo(direction2Label)
        }
        
        contentView.addSubview(direction3ImageView)
        direction3ImageView.snp.makeConstraints { make in
            make.top.equalTo(direction3Label.snp.bottom).offset(30)
            make.centerX.equalTo(direction3Label)
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(direction3ImageView.snp.width)
        }
        
        contentView.addSubview(direction4Label)
        direction4Label.snp.makeConstraints { make in
            make.top.equalTo(direction3ImageView.snp.bottom).offset(30)
            make.left.right.equalTo(direction3Label)
        }
        
        contentView.addSubview(direction4ImageView)
        direction4ImageView.snp.makeConstraints { make in
            make.top.equalTo(direction4Label.snp.bottom).offset(30)
            make.centerX.equalTo(direction4Label)
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(direction4ImageView.snp.width)
        }
        
        contentView.addSubview(direction5Label)
        direction5Label.snp.makeConstraints { make in
            make.top.equalTo(direction4ImageView.snp.bottom).offset(30)
            make.left.right.equalTo(direction4Label)
        }
        
        contentView.addSubview(direction5ImageView)
        direction5ImageView.snp.makeConstraints { make in
            make.top.equalTo(direction5Label.snp.bottom).offset(30)
            make.centerX.equalTo(direction5Label)
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(direction5ImageView.snp.width)
        }
        
        contentView.addSubview(startButton)
        startButton.snp.makeConstraints { make in
            make.top.equalTo(direction5ImageView.snp.bottom).offset(30)
            make.left.right.equalTo(prepareGuideTitle)
            make.height.equalTo(60)
            make.bottom.equalToSuperview().offset(-20)
        }
    }
}
