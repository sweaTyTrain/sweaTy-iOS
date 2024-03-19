//
//  SignUpViewController.swift
//  SweaTy
//
//  Created by 이대현 on 3/18/24.
//

import UIKit

final class SignUpViewController: UIViewController {
    private lazy var titleLabel = {
        let label = UILabel()
        label.text = "회원가입"
        return label
    }()
    
    private lazy var idTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "아이디 또는 이메일"
        return textField
    }()
    
    private lazy var pwTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "비밀번호"
        return textField
    }()
    
    private lazy var pwConfirmTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "비밀번호 확인"
        return textField
    }()
    
    private lazy var signUpButton: UIButton = {
        let button = UIButton()
        button.setTitle("가입하기", for: .normal)
        button.backgroundColor = .sweatyGreen
        return button
    }()
    
    override func viewDidLoad() {
        view.backgroundColor = .systemBackground
        layout()
    }
    
    private func layout() {
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(50)
            make.centerX.equalTo(view.safeAreaLayoutGuide)
        }
        
        view.addSubview(idTextField)
        idTextField.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(50)
            make.left.equalTo(view.safeAreaLayoutGuide).offset(50)
            make.right.equalTo(view.safeAreaLayoutGuide).offset(-50)
        }
        
        view.addSubview(pwTextField)
        pwTextField.snp.makeConstraints { make in
            make.top.equalTo(idTextField.snp.bottom).offset(50)
            make.left.right.equalTo(idTextField)
        }
        
        view.addSubview(pwConfirmTextField)
        pwConfirmTextField.snp.makeConstraints { make in
            make.top.equalTo(pwTextField.snp.bottom).offset(50)
            make.left.right.equalTo(pwTextField)
        }
        
        view.addSubview(signUpButton)
        signUpButton.snp.makeConstraints { make in
            make.top.equalTo(pwConfirmTextField.snp.bottom).offset(50)
            make.left.right.equalTo(pwConfirmTextField)
            make.height.equalTo(50)
        }
    }
}
