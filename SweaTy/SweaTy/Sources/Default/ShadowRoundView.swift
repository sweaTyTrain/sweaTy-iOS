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
    
    private var innerView: UIView? = nil
    
    
    init(view: UIView, _ frame: CGRect = .zero) {
        super.init(frame: frame)
        self.innerView = view
        self.setupLayout()
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowRadius = 10
        
        if let innerView = innerView {
            contentView.addSubview(innerView)
            innerView.snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }
        }
        
        self.addSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.left.top.right.bottom.equalToSuperview()
        }
        
        self.contentView.layer.cornerRadius = 10
        self.contentView.layer.masksToBounds = true
        self.contentView.backgroundColor = .white
    }
    
    func setColor(_ color: UIColor) {
        self.contentView.backgroundColor = color
    }
}
