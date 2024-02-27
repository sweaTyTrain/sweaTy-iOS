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
        mainVC.delegate = self
        navigationController.pushViewController(mainVC, animated: true)
    }
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}

extension HomeCoordinator: MainViewControllerDelegate,
                           ExerciseSelectViewControllerDelegate,
                           PrepareViewControllerDelegate,
                           ExercisingViewControllerDelegate {
    func moveSelectView() {
        let selectVC = ExerciseSelectViewController()
        selectVC.delegate = self
        navigationController.pushViewController(selectVC, animated: true)
    }
    
    func movePrepareView() {
        let prepareVC = PrepareViewController()
        prepareVC.delegate = self
        navigationController.pushViewController(prepareVC, animated: true)
    }
    
    func moveExercisingView() {
        let exercisingVC = ExercisingViewController()
        exercisingVC.delegate = self
        navigationController.pushViewController(exercisingVC, animated: true)
    }
    
    func moveResultView() {
        let resultVC = ExerciseResultViewController()
        navigationController.pushViewController(resultVC, animated: true)
    }
}
