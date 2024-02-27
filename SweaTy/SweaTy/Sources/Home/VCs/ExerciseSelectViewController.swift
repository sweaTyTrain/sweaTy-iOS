//
//  ExerciseSelectViewController.swift
//  SweaTy
//
//  Created by 이대현 on 2/24/24.
//

import SnapKit
import UIKit

protocol ExerciseSelectViewControllerDelegate: AnyObject {
    func movePrepareView()
}

final class ExerciseSelectViewController: UIViewController {
    private lazy var contentView = {
        let view = UIView()
        view.backgroundColor = .systemGray5
        return view
    }()
    
    private lazy var titleView: ShadowRoundView = {
        let titleLabel = UILabel()
        titleLabel.text = "대현님, 오늘은 어떤 운동을 해볼까요? 💪"
        titleLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        let view = UIView()
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        return ShadowRoundView(view: view)
    }()
    
    private lazy var exerciseSelectView: ShadowRoundView = {
        let view = UIView()
        let squatSelectView = SetSelectionView()
        let lungeSelectView = SetSelectionView()
        let pushupSelectView = SetSelectionView()
        let calorieLabel = UILabel()
        calorieLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        calorieLabel.text = "1000 kcal 감량 가능해요! 🔥"
        
        [
            squatSelectView,
            lungeSelectView,
            pushupSelectView,
            calorieLabel
        ].forEach {
            view.addSubview($0)
        }
        
        squatSelectView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(100)
        }
        
        lungeSelectView.snp.makeConstraints { make in
            make.top.equalTo(squatSelectView.snp.bottom).offset(20)
            make.left.right.equalTo(squatSelectView)
            make.height.equalTo(100)
        }
        
        pushupSelectView.snp.makeConstraints { make in
            make.top.equalTo(lungeSelectView.snp.bottom).offset(20)
            make.left.right.equalTo(squatSelectView)
            make.height.equalTo(100)
        }
        
        calorieLabel.snp.makeConstraints { make in
            make.top.equalTo(pushupSelectView.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-20)
        }
        return ShadowRoundView(view: view)
    }()
    
    private lazy var startButton: UIButton = {
        var config = UIButton.Configuration.filled()
        config.background.backgroundColor = .sweatyGreen
        config.baseForegroundColor = .black
        var titleContainer = AttributeContainer()
        titleContainer.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        config.attributedTitle = AttributedString("운동 시작!", attributes: titleContainer)
        let button = UIButton()
        button.configuration = config
        button.addAction(UIAction { [weak self] _ in
            self?.delegate?.movePrepareView()
        }, for: .touchUpInside)
        return button
    }()
    
    weak var delegate: ExerciseSelectViewControllerDelegate? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBackground
        self.layout()
    }
    
    private func layout() {
        navigationItem.title = "운동 선택하기"

        view.addSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        contentView.addSubview(titleView)
        titleView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(60)
        }
        
        contentView.addSubview(exerciseSelectView)
        exerciseSelectView.snp.makeConstraints { make in
            make.top.equalTo(titleView.snp.bottom).offset(30)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
        }
        
        contentView.addSubview(startButton)
        startButton.snp.makeConstraints { make in
            make.top.equalTo(exerciseSelectView.snp.bottom).offset(20)
            make.left.right.equalTo(titleView)
            make.height.equalTo(60)
        }
    }
}
