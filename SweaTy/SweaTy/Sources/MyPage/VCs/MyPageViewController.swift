//
//  MyPageViewController.swift
//  SweaTy
//
//  Created by 이대현 on 2/18/24.
//

import UIKit
import SnapKit

final class MyPageViewController: UIViewController {
    private lazy var myPageProfileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "person")
        imageView.backgroundColor = .sweatyGreen
        imageView.clipsToBounds = true

        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "사용자 회원님, 화이팅!"
        label.font = .systemFont(ofSize: 24, weight: .bold)
        
        return label
    }()
    
    private lazy var userInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "회원 정보"
        label.font = .systemFont(ofSize: 17, weight: .bold)
        return label
    }()
    
    private lazy var settingView1: ShadowRoundView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .leading
        stackView.spacing = 5
        stackView.addArrangedSubview(SettingItemView(iconName: "photo", description: "체중 변경"))
        stackView.addArrangedSubview(SettingItemView(iconName: "photo", description: "운동 강도 변경"))
        stackView.addArrangedSubview(SettingItemView(iconName: "photo", description: "기본 정보 설정"))
        stackView.layoutMargins = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        stackView.isLayoutMarginsRelativeArrangement = true
        return ShadowRoundView(view: stackView)
    }()
    
    private lazy var accountLabel: UILabel = {
        let label = UILabel()
        label.text = "계정 관리"
        label.font = .systemFont(ofSize: 17, weight: .bold)
        return label
    }()
    
    private lazy var settingView2: ShadowRoundView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .leading
        stackView.spacing = 5
        stackView.addArrangedSubview(SettingItemView(iconName: "", description: "로그아웃"))
        stackView.layoutMargins = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        stackView.isLayoutMarginsRelativeArrangement = true
        return ShadowRoundView(view: stackView)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        myPageProfileImage.layer.cornerRadius = myPageProfileImage.frame.height/2
    }
    
    
    private func setupUI() {
        view.addSubview(myPageProfileImage)
        myPageProfileImage.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            $0.centerX.equalTo(view.safeAreaLayoutGuide)
            $0.height.width.equalTo(120)
        }
        
        view.addSubview(nameLabel)
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(myPageProfileImage.snp.bottom).offset(20)
            $0.centerX.equalTo(myPageProfileImage.snp.centerX)
        }
        
        view.addSubview(userInfoLabel)
        userInfoLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(40)
            $0.left.equalTo(view.safeAreaLayoutGuide).offset(35)
        }
        
        view.addSubview(settingView1)
        settingView1.snp.makeConstraints {
            $0.top.equalTo(userInfoLabel.snp.bottom).offset(10)
            $0.left.equalTo(view.safeAreaLayoutGuide).offset(30)
            $0.right.equalTo(view.safeAreaLayoutGuide).offset(-30)
        }
        
        view.addSubview(accountLabel)
        accountLabel.snp.makeConstraints {
            $0.top.equalTo(settingView1.snp.bottom).offset(30)
            $0.left.equalTo(userInfoLabel)
        }
        
        view.addSubview(settingView2)
        settingView2.snp.makeConstraints {
            $0.top.equalTo(accountLabel.snp.bottom).offset(10)
            $0.left.right.equalTo(settingView1)
        }
    }
}
