//
//  StartExerciseView.swift
//  SweaTy
//
//  Created by 이대현 on 2/23/24.
//

import SnapKit
import UIKit

final class StartExerciseView: UIView {
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.text = "01.04. 목요일"
        return label
    }()
    
    private lazy var startButton: UIButton = {
        var config = UIButton.Configuration.filled()
        config.background.backgroundColor = .sweatyGreen
        config.baseForegroundColor = .black
        config.title = "오늘의 운동 시작하기"
        let button = UIButton()
        button.configuration = config
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.addSubview(dateLabel)
        dateLabel.snp.makeConstraints { make in
            make.top.left.equalToSuperview().offset(20)
        }
        
        self.addSubview(startButton)
        startButton.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.bottom.equalToSuperview().offset(-20)
            make.height.equalTo(50)
        }
    }
    
    func addAction(_ action: UIAction) {
        startButton.addAction(action, for: .touchUpInside)
    }
}
