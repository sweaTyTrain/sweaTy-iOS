//
//  Coordinator.swift
//  SweaTy
//
//  Created by 이대현 on 2/18/24.
//

import Foundation

protocol Coordinator : AnyObject {
    var childCoordinators: [Coordinator] { get set }
    
    // coordinator의 시작 지점
    func start()
}
