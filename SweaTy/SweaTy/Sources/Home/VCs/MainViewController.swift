//
//  MainViewController.swift
//  SweaTy
//
//  Created by 이대현 on 2/18/24.
//

import SnapKit
import UIKit

class MainViewController: UIViewController {
    private lazy var logoLabel : UILabel = {
        let label = UILabel()
        label.text = "SweaTy"
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        return label
    }()
    
    private lazy var mainScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .systemGray5
        return scrollView
    }()
    
    private lazy var mainContentView = UIView()
    
    private lazy var startExerciseView: ShadowRoundView = {
        let view = ShadowRoundView()
        return view
    }()
    
    private lazy var weekCalendarLabel : UILabel = {
        let label = UILabel()
        label.text = "이번주 운동 성과에요."
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    
    private lazy var weekCalendarView: ShadowRoundView = {
        let view = ShadowRoundView()
        return view
    }()
    
    private lazy var homeTrainingLabel : UILabel = {
        let label = UILabel()
        label.text = "집에서 하기 좋은 운동"
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    
    private lazy var homeTrainingView: ShadowRoundView = {
        let view = ShadowRoundView()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        self.layout()
    }
    
    private func layout() {
        view.addSubview(logoLabel)
        logoLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.left.equalTo(view.safeAreaLayoutGuide).offset(20)
        }
        
        view.addSubview(mainScrollView)
        mainScrollView.snp.makeConstraints { make in
            make.top.equalTo(logoLabel.snp.bottom).offset(20)
            make.left.equalTo(view.safeAreaLayoutGuide)
            make.right.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-20)
        }
        
        mainScrollView.addSubview(mainContentView)
        mainContentView.snp.makeConstraints { make in
            make.edges.equalTo(mainScrollView.contentLayoutGuide)
            make.height.greaterThanOrEqualTo(view.snp.height).priority(.low)
            make.width.equalTo(mainScrollView.snp.width)
        }
        
        mainContentView.addSubview(startExerciseView)
        startExerciseView.snp.makeConstraints { make in
            make.top.equalTo(mainScrollView).offset(20)
            make.left.equalTo(mainScrollView).offset(20)
            make.right.equalTo(mainScrollView).offset(-20)
            make.height.equalTo(150)
        }
        
        mainContentView.addSubview(weekCalendarLabel)
        weekCalendarLabel.snp.makeConstraints { make in
            make.top.equalTo(startExerciseView.snp.bottom).offset(20)
            make.left.right.equalTo(startExerciseView)
        }
        
        mainContentView.addSubview(weekCalendarView)
        weekCalendarView.snp.makeConstraints { make in
            make.top.equalTo(weekCalendarLabel.snp.bottom).offset(20)
            make.left.right.equalTo(weekCalendarLabel)
            make.height.equalTo(200)
        }
        
        mainContentView.addSubview(homeTrainingLabel)
        homeTrainingLabel.snp.makeConstraints { make in
            make.top.equalTo(weekCalendarView.snp.bottom).offset(20)
            make.left.right.equalTo(weekCalendarView)
        }
        
        mainContentView.addSubview(homeTrainingView)
        homeTrainingView.snp.makeConstraints { make in
            make.top.equalTo(homeTrainingLabel.snp.bottom).offset(20)
            make.left.right.equalTo(homeTrainingLabel)
            make.height.equalTo(200)
            make.bottom.equalTo(mainContentView).offset(-20)
        }
    }
}
