//
//  HomeCoordinator.swift
//  SweaTy
//
//  Created by 이대현 on 2/18/24.
//

import UIKit

final class HomeCoordinator : Coordinator {
    var childCoordinators: [Coordinator] = []
    
    var navigationController: UINavigationController

    func start() {
        let mainVC = MainViewController()
        navigationController.pushViewController(mainVC, animated: true)
    }
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}
