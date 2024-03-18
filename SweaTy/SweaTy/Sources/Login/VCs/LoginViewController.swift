//
//  LoginViewController.swift
//  SweaTy
//
//  Created by 이대현 on 3/18/24.
//

import SnapKit
import UIKit

protocol LoginViewControllerDelegate: AnyObject {
    func moveSignUpView()
}

final class LoginViewController: UIViewController {
    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "photo")
        return imageView
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
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("로그인", for: .normal)
        button.backgroundColor = .sweatyGreen
        return button
    }()
    
    private lazy var signUpLabel: UILabel = {
        let label = UILabel()
        label.text = "이메일로 회원가입"
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(signUpLabelClicked))
        label.addGestureRecognizer(tapGestureRecognizer)
        label.isUserInteractionEnabled = true
        return label
    }()
    
    var delegate: LoginViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
    }
    
    private func layout() {
        view.backgroundColor = .systemBackground
        view.addSubview(logoImageView)
        logoImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(30)
            make.centerX.equalTo(view.safeAreaLayoutGuide)
            make.width.equalTo(view.safeAreaLayoutGuide).multipliedBy(0.6)
            make.height.equalTo(logoImageView.snp.width)
        }
        
        view.addSubview(idTextField)
        idTextField.snp.makeConstraints { make in
            make.top.equalTo(logoImageView.snp.bottom).offset(50)
            make.left.equalTo(view.safeAreaLayoutGuide).offset(50)
            make.right.equalTo(view.safeAreaLayoutGuide).offset(-50)
        }
        
        view.addSubview(pwTextField)
        pwTextField.snp.makeConstraints { make in
            make.top.equalTo(idTextField.snp.bottom).offset(50)
            make.left.right.equalTo(idTextField)
        }
        
        view.addSubview(loginButton)
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(pwTextField.snp.bottom).offset(50)
            make.left.right.equalTo(pwTextField)
            make.height.equalTo(50)
        }
        
        view.addSubview(signUpLabel)
        signUpLabel.snp.makeConstraints { make in
            make.top.equalTo(loginButton.snp.bottom).offset(30)
            make.centerX.equalTo(loginButton)
        }
    }
    
    @objc private func signUpLabelClicked(_ tapRecognizer: UITapGestureRecognizer) {
        delegate?.moveSignUpView()
    }
}
