//
//  AppCoordinator.swift
//  SweaTy
//
//  Created by 이대현 on 2/18/24.
//

import UIKit

class AppCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    private var navigationController: UINavigationController!
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        // 이후 여기에 로그인 로직 추가
        
//        showLoginViewController()
//        showMainTabBarController() // 임시
        showRenewalMainViewController()
    }
    
    private func showMainTabBarController() {
        let coordinator = MainTabBarCoordinator(navigationController: self.navigationController)
        coordinator.start()
        self.childCoordinators.append(coordinator)
    }
    
    private func showLoginViewController() {
        let coordinator = LoginCoordinator(navigationController: self.navigationController)
        coordinator.start()
        self.childCoordinators.append(coordinator)
    }
    private func showRenewalMainViewController() {
        let coordinator = RenewalHomeCoordinator(navigationController: self.navigationController)
        coordinator.start()
        self.childCoordinators.append(coordinator)
    }
}
