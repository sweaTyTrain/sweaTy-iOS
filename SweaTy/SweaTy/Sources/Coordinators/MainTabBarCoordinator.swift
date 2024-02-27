//
//  MainTabBarCoordinator.swift
//  SweaTy
//
//  Created by 이대현 on 2/18/24.
//

import UIKit

class MainTabBarCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    
    var navigationController: UINavigationController
    var tabBarController: UITabBarController
    
    func start() {
        // tabBar item 리스트
        let pages: [TabBarItemType] = TabBarItemType.allCases
        // 각각의 tabBarItem 생성하기
        let tabBarItems: [UITabBarItem] = pages.map { self.createTabBarItem(of: $0) }
        // 탭바별로 navigationController 생성
        let controllers: [UINavigationController] = tabBarItems.map {
            self.createTabNavigationController(tabBarItem: $0)
        }
        // 탭바별로 코디네이터 생성
        let _ = controllers.map{ self.startTabCoordinator(tabNavigationController: $0) }
        // 탭바 스타일 지정 및 VC 연결
        self.configureTabBarController(tabNavigationControllers: controllers)
        // 탭바 화면에 연결
        self.addTabBarController()
    }
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.navigationController.isNavigationBarHidden = true
        self.tabBarController = UITabBarController()
    }
    
    private func configureTabBarController(tabNavigationControllers: [UIViewController]) {
        // TabBar의 VC 지정
        self.tabBarController.setViewControllers(tabNavigationControllers, animated: false)
        // home의 index로 TabBar Index 세팅
        self.tabBarController.selectedIndex = TabBarItemType.home.toInt()
        // TabBar 스타일 지정
        self.tabBarController.view.backgroundColor = .systemBackground
        self.tabBarController.tabBar.backgroundColor = .systemBackground
        self.tabBarController.tabBar.tintColor = .sweatyGreen
    }
    
    
    private func createTabBarItem(of page: TabBarItemType) -> UITabBarItem {
        return UITabBarItem(
            title: page.toKrName(),
            image: UIImage(systemName: page.toIconName()),
            tag: page.toInt()
        )
    }
    
    private func createTabNavigationController(tabBarItem: UITabBarItem) -> UINavigationController {
        let tabNavigationController = UINavigationController()
            
        tabNavigationController.setNavigationBarHidden(false, animated: false)
        tabNavigationController.navigationBar.topItem?.title = TabBarItemType(index: tabBarItem.tag)?.toKrName()
        tabNavigationController.tabBarItem = tabBarItem

        return tabNavigationController
    }
    
    private func startTabCoordinator(tabNavigationController: UINavigationController) {
        // tag 번호로 TabBarPage로 변경
        let tabBarItemTag: Int = tabNavigationController.tabBarItem.tag
        guard let tabBarItemType: TabBarItemType = TabBarItemType(index: tabBarItemTag) else { return }
        
        // 코디네이터 생성 및 실행
        switch tabBarItemType {
        case .home:
            let homeCoordinator = HomeCoordinator(navigationController: tabNavigationController)
            homeCoordinator.start()
            
        case .statistics:
            let statCoordinator = StatisticsCoordinator(navigationController: tabNavigationController)
            statCoordinator.start()
            
        case .mypage:
            let myPageCoordinator = MyPageCoordinator(navigationController: tabNavigationController)
            myPageCoordinator.start()
        }
    }
    private func addTabBarController(){
        self.navigationController.pushViewController(self.tabBarController, animated: true)
    }
}
