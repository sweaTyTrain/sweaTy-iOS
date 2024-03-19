//
//  SettingItemView.swift
//  SweaTy
//
//  Created by 이대현 on 3/19/24.
//

import UIKit

import SnapKit

final class SettingItemView: UIView {
    private let customDescription: String
    private let customIconName: String
    
    init(iconName: String, description: String) {
        self.customDescription = description
        self.customIconName = iconName
        super.init(frame: .zero)
        self.setupStyles()
        self.setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let settingDescriptionButton = UIButton()
    
    private func setupStyles() {
        var descriptionConfig = UIButton.Configuration.filled()
        descriptionConfig.baseBackgroundColor = .white
        descriptionConfig.baseForegroundColor = .black

        var titleAttr = AttributedString.init(customDescription)
        titleAttr.font = .systemFont(ofSize: 15.0, weight: .medium)
        
        descriptionConfig.attributedTitle = titleAttr
        
        settingDescriptionButton.configuration = descriptionConfig
    }
    
    private func setupConstraints() {
        addSubview(settingDescriptionButton)
        settingDescriptionButton.snp.makeConstraints {
            $0.left.equalToSuperview().offset(10)
            $0.top.bottom.equalToSuperview()
            $0.height.equalTo(40)
        }
    }
}

