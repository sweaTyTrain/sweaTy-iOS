//
//  StatisticsCoordinator.swift
//  SweaTy
//
//  Created by 이대현 on 2/18/24.
//

import UIKit

final class StatisticsCoordinator : Coordinator {
    var childCoordinators: [Coordinator] = []
    
    var navigationController: UINavigationController

    func start() {
        let statVC = StatisticsViewController()
        navigationController.pushViewController(statVC, animated: true)
    }
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}
