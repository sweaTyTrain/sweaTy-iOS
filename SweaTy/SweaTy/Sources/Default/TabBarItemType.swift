//
//  TabBarItemType.swift
//  SweaTy
//
//  Created by 이대현 on 2/18/24.
//

import Foundation

enum TabBarItemType: String, CaseIterable {
    case home, statistics, mypage
    
    // Int형에 맞춰 초기화
    init?(index: Int) {
        switch index {
        case 0: self = .home
        case 1: self = .statistics
        case 2: self = .mypage
        default: return nil
        }
    }
    
    /// TabBarPage 형을 매칭되는 Int형으로 반환
    func toInt() -> Int {
        switch self {
        case .home: return 0
        case .statistics: return 1
        case .mypage: return 2
        }
    }
    
    /// TabBarPage 형을 매칭되는 한글명으로 변환
    func toKrName() -> String {
        switch self {
        case .home: return "홈"
        case .statistics: return "통계"
        case .mypage: return "마이페이지"
        }
    }
    
    /// TabBarPage 형을 매칭되는 아이콘명으로 변환
    func toIconName() -> String {
        switch self {
        case .home: return "house"
        case .statistics: return "magnifyingglass"
        case .mypage: return "person"
        }
    }
}
