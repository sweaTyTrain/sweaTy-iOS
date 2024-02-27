//
//  SetSelectionView.swift
//  SweaTy
//
//  Created by 이대현 on 2/26/24.
//

import UIKit

final class SetSelectionView: UIView {
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "스쿼트"
        return label
    }()
    
    private lazy var countTextField: UITextField = {
        let textField = UITextField()
        textField.text = "12회"
        return textField
    }()
    
    private lazy var setTextField: UITextField = {
        let textField = UITextField()
        textField.text = "3세트"
        return textField
    }()
    
    private lazy var xLabel: UILabel = {
        let label = UILabel()
        label.text = "X"
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(30)
        }
        
        self.addSubview(setTextField)
        setTextField.snp.makeConstraints { make in
            make.centerY.equalTo(titleLabel)
            make.right.equalToSuperview().offset(-30)
        }
        
        self.addSubview(xLabel)
        xLabel.snp.makeConstraints { make in
            make.centerY.equalTo(setTextField)
            make.right.equalTo(setTextField.snp.left).offset(-20)
        }
        
        self.addSubview(countTextField)
        countTextField.snp.makeConstraints { make in
            make.centerY.equalTo(xLabel)
            make.right.equalTo(xLabel.snp.left).offset(-20)
        }
    }
}
