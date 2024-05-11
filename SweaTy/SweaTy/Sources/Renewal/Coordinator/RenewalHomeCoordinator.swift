//
//  RenewalHomeCoordinator.swift
//  SweaTy
//
//  Created by 이대현 on 4/28/24.
//

import UIKit

final class RenewalHomeCoordinator : Coordinator {
    var childCoordinators: [Coordinator] = []
    
    var navigationController: UINavigationController

    func start() {
        let startVC = StartingViewController()
        startVC.delegate = self
        navigationController.pushViewController(startVC, animated: true)
    }
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}

extension RenewalHomeCoordinator: StartingViewControllerDelegate,
                                  ExerciseListViewControllerDelegate,
                                  ExerciseDetailViewControllerDelegate,
                                  PrepareViewControllerDelegate,
                                  ExercisingViewControllerDelegate,
                                  ExerciseResultViewControllerDelegate {
    func moveToListView() {
        navigationController.viewControllers = []
        let listVC = ExerciseListViewController()
        listVC.delegate = self
        navigationController.pushViewController(listVC, animated: true)
    }
    
    func moveToDetailView(info: ExerciseInfo) {
        let detailVC = ExerciseDetailViewController()
        detailVC.delegate = self
        navigationController.pushViewController(detailVC, animated: true)
    }
    
    func moveToPrepareView() {
        let prepareVC = PrepareViewController()
        prepareVC.delegate = self
        navigationController.pushViewController(prepareVC, animated: true)
    }
    
    func moveExercisingView() {
        let exercingVC = ExercisingViewController()
        exercingVC.delegate = self
        navigationController.pushViewController(exercingVC, animated: true)
    }
    
    func moveResultView() {
        navigationController.viewControllers = []
        let resultVC = ExerciseResultViewController()
        resultVC.delegate = self
        navigationController.pushViewController(resultVC, animated: true)
    }
}
