//
//  MyPageCoordinator.swift
//  SweaTy
//
//  Created by 이대현 on 2/18/24.
//

import UIKit

final class MyPageCoordinator : Coordinator {
    var childCoordinators: [Coordinator] = []
    
    var navigationController: UINavigationController

    func start() {
        let myPageVC = MyPageViewController()
        navigationController.pushViewController(myPageVC, animated: true)
    }
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}
