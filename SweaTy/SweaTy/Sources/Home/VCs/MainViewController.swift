//
//  MainViewController.swift
//  SweaTy
//
//  Created by 이대현 on 2/18/24.
//

import Charts
import SnapKit
import UIKit
import DGCharts

protocol MainViewControllerDelegate: AnyObject {
    func moveSelectView()
}

class MainViewController: UIViewController {
    private lazy var logoLabel : UILabel = {
        let label = UILabel()
        label.text = "SweaTy"
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        return label
    }()
    
    private lazy var mainScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .systemBackground
        return scrollView
    }()
    
    private lazy var mainContentView = UIView()
    
    
    
    private lazy var startExerciseView: ShadowRoundView = {
        let startExerciseView = StartExerciseView()
        let action = UIAction { [weak self] _ in
            self?.delegate?.moveSelectView()
        }
        startExerciseView.addAction(action)
        let view = ShadowRoundView(view: startExerciseView)
        return view
    }()
    
    private lazy var weekCalendarLabel : UILabel = {
        let label = UILabel()
        label.text = "이번주 운동 성과에요."
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    
    private lazy var weekCalendarView: ShadowRoundView = {
        let barChartView = BarChartView()
        barChartView.noDataText = "데이터가 없습니다."
        barChartView.noDataFont = .systemFont(ofSize: 20)
        barChartView.noDataTextColor = .lightGray
        barChartView.setChart()
        let view = ShadowRoundView(view: barChartView)
        return view
    }()
    
    private lazy var homeTrainingLabel : UILabel = {
        let label = UILabel()
        label.text = "집에서 하기 좋은 운동"
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    
    private lazy var homeTrainingCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ImageLabelCollectionViewCell.self, forCellWithReuseIdentifier: "ImageLabelCollectionViewCell")
        return collectionView
    }()
    
    // weak var로 하면, viewDidLoad 이후 nil이 되어버림??
    var delegate: MainViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        self.layout()
    }
    
    private func layout() {
        view.addSubview(logoLabel)
        logoLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.left.equalTo(view.safeAreaLayoutGuide).offset(20)
        }
        
        view.addSubview(mainScrollView)
        mainScrollView.snp.makeConstraints { make in
            make.top.equalTo(logoLabel.snp.bottom).offset(20)
            make.left.equalTo(view.safeAreaLayoutGuide)
            make.right.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-20)
        }
        
        mainScrollView.addSubview(mainContentView)
        mainContentView.snp.makeConstraints { make in
            make.edges.equalTo(mainScrollView.contentLayoutGuide)
            make.height.greaterThanOrEqualTo(view.snp.height).priority(.low)
            make.width.equalTo(mainScrollView.snp.width)
        }
        
        mainContentView.addSubview(startExerciseView)
        startExerciseView.snp.makeConstraints { make in
            make.top.equalTo(mainScrollView).offset(20)
            make.left.equalTo(mainScrollView).offset(20)
            make.right.equalTo(mainScrollView).offset(-20)
            make.height.equalTo(130)
        }
        
        mainContentView.addSubview(weekCalendarLabel)
        weekCalendarLabel.snp.makeConstraints { make in
            make.top.equalTo(startExerciseView.snp.bottom).offset(20)
            make.left.right.equalTo(startExerciseView)
        }
        
        mainContentView.addSubview(weekCalendarView)
        weekCalendarView.snp.makeConstraints { make in
            make.top.equalTo(weekCalendarLabel.snp.bottom).offset(20)
            make.left.right.equalTo(weekCalendarLabel)
            make.height.equalTo(200)
        }
        
        mainContentView.addSubview(homeTrainingLabel)
        homeTrainingLabel.snp.makeConstraints { make in
            make.top.equalTo(weekCalendarView.snp.bottom).offset(20)
            make.left.right.equalTo(weekCalendarView)
        }
        
        mainContentView.addSubview(homeTrainingCollectionView)
        homeTrainingCollectionView.snp.makeConstraints { make in
            make.top.equalTo(homeTrainingLabel.snp.bottom).offset(20)
            make.left.right.equalTo(homeTrainingLabel)
            make.height.equalTo(150)
            make.bottom.equalTo(mainContentView).offset(-20)
        }
    }
}

extension MainViewController: UICollectionViewDataSource,
                              UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageLabelCollectionViewCell", for: indexPath) as? ImageLabelCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        return cell
    }
}

extension MainViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width
        let numberOfItemsPerRow: CGFloat = 2
        let spacing: CGFloat = 35 // width spacing
        let availableWidth = width - spacing * (numberOfItemsPerRow + 1)
        let itemDimension = floor(availableWidth / numberOfItemsPerRow)
        return CGSize(width: itemDimension, height: itemDimension)
    }
}
