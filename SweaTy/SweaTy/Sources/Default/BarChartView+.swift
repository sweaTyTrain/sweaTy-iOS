//
//  BarChartView+.swift
//  SweaTy
//
//  Created by 이대현 on 3/6/24.
//

import Charts
import DGCharts
import UIKit

extension BarChartView {
    func setChart() {
        let dataPointTest = ["일", "월", "화", "수", "목", "금", "토"]
        let valueTest = [2.0, 1.5, 0.3, 0.6, 1.0, 1.8, 1.3]
        // 데이터 생성
        var dataEntries: [BarChartDataEntry] = []
        for i in 0..<dataPointTest.count {
            let dataEntry = BarChartDataEntry(x: Double(i), y: valueTest[i])
            dataEntries.append(dataEntry)
        }

        let chartDataSet = BarChartDataSet(entries: dataEntries, label: "시간")

        // 차트 컬러
        chartDataSet.colors = [.sweatyGreen ]

        // 데이터 삽입
        let chartData = BarChartData(dataSet: chartDataSet)
        self.data = chartData
        
        // 선택 안되게
        chartDataSet.highlightEnabled = false
        // 줌 안되게
        self.doubleTapToZoomEnabled = false
        
        // X축 레이블 위치 조정
        self.xAxis.labelPosition = .bottom
        // X축 레이블 포맷 지정
        self.xAxis.valueFormatter = IndexAxisValueFormatter(values: dataPointTest)
        
        // X축 레이블 갯수 최대로 설정 (이 코드 안쓸 시 Jan Mar May 이런식으로 띄엄띄엄 조금만 나옴)
        self.xAxis.setLabelCount(dataPointTest.count, force: false)
        
        // 오른쪽 레이블 제거
        self.rightAxis.enabled = false
        
        // 기본 애니메이션
        self.animate(xAxisDuration: 1.0, yAxisDuration: 1.0)

    }
    
}
