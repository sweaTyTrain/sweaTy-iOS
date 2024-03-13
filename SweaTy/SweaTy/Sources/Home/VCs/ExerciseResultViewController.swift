//
//  ExerciseResultViewController.swift
//  SweaTy
//
//  Created by 이대현 on 2/26/24.
//

import UIKit

protocol ExerciseResultViewControllerDelegate: AnyObject {
    func moveMainView()
}

final class ExerciseResultViewController: UIViewController {
    private lazy var mainScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .systemBackground
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var titleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "checkmark.circle")
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "운동 완료"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 32, weight: .bold)
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "정말 대단해요!\n운동 후에는 스트레칭을 통해 근육을 풀어주세요"
        label.textAlignment = .center
        label.numberOfLines = 2
        return label
    }()
    
    private lazy var feedbackView: ShadowRoundView = {
        let view = UIView()
        let titleLabel = UILabel()
        titleLabel.text = "AI 코치의 운동 피드백"
        titleLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        let descriptionLabel = UILabel()
        descriptionLabel.text = "전반적인 동작 평균 정확도가 낮아요! 운동하실 때 전신이 화면 안으로 들어와야 AI 코치가 보다 정확하게 동작을 분석할 수 있어요!"
        descriptionLabel.numberOfLines = 0
        
        [
            titleLabel,
            descriptionLabel
        ].forEach {
            view.addSubview($0)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(30)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(30)
            make.left.right.equalTo(titleLabel)
        }
        
        return ShadowRoundView(view: view)
    }()
    
    private lazy var confirmButton: UIButton = {
        var config = UIButton.Configuration.filled()
        config.background.backgroundColor = .sweatyGreen
        config.baseForegroundColor = .black
        var titleContainer = AttributeContainer()
        titleContainer.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        config.attributedTitle = AttributedString("확인", attributes: titleContainer)
        let button = UIButton()
        button.configuration = config
        button.addAction(UIAction { [weak self] _ in
            self?.delegate?.moveMainView()
        }, for: .touchUpInside)
        return button
    }()
    
    weak var delegate: ExerciseResultViewControllerDelegate?
    
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
        
        contentView.addSubview(titleImageView)
        titleImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(30)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.5)
            make.height.equalTo(titleImageView.snp.width)
        }

        
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleImageView.snp.bottom).offset(30)
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview().offset(-30)
        }
        
        contentView.addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(30)
            make.left.right.equalTo(titleLabel)
        }
        
        contentView.addSubview(feedbackView)
        feedbackView.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(30)
            make.left.right.equalTo(descriptionLabel)
            make.height.equalTo(200)
        }
        
        contentView.addSubview(confirmButton)
        confirmButton.snp.makeConstraints { make in
            make.top.equalTo(feedbackView.snp.bottom).offset(30)
            make.left.right.equalTo(feedbackView)
            make.height.equalTo(60)
            make.bottom.equalToSuperview().offset(-40)
        }

    }
}
