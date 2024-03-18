//
//  LoginCoordinator.swift
//  SweaTy
//
//  Created by 이대현 on 3/18/24.
//

import UIKit

final class LoginCoordinator : Coordinator {
    var childCoordinators: [Coordinator] = []
    
    var navigationController: UINavigationController

    func start() {
        let loginVC = LoginViewController()
        loginVC.delegate = self
        navigationController.pushViewController(loginVC, animated: true)
    }
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}

extension LoginCoordinator: LoginViewControllerDelegate {
    func moveSignUpView() {
        let signUpVC = SignUpViewController()
        navigationController.pushViewController(signUpVC, animated: true)
    }
}
