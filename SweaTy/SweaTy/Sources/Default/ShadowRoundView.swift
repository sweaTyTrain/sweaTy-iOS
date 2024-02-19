//
//  ShadowRoundView.swift
//  SweaTy
//
//  Created by 이대현 on 2/19/24.
//

import SnapKit
import UIKit

final class ShadowRoundView: UIView {
    private let contentView: UIView = {
        let view = UIView()
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupLayout()
    }
    
//    convenience init(height: Int) {
//        self.init(frame: CGRect(x: 0, y: 0, width: 0, height: height))
//    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowRadius = 10
        
        self.addSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.left.top.right.bottom.equalToSuperview()
        }
        
        self.contentView.layer.cornerRadius = 10
        self.contentView.layer.masksToBounds = true
        self.contentView.backgroundColor = .white
    }
}
