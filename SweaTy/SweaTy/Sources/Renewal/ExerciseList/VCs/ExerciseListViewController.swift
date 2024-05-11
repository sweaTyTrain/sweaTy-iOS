//
//  ExerciseListViewController.swift
//  SweaTy
//
//  Created by 이대현 on 4/8/24.
//

import SnapKit
import UIKit

protocol ExerciseListViewControllerDelegate: AnyObject {
    func moveToDetailView(info: ExerciseInfo)
}

final class ExerciseListViewController: UIViewController {
    private lazy var listColllectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(ExerciseListCollectionViewCell.self, forCellWithReuseIdentifier: ExerciseListCollectionViewCell.identifier)
        collectionView.backgroundColor = .systemGray5
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()
    
    var delegate: ExerciseListViewControllerDelegate?
    
    let exerciseInfo: [ExerciseInfo] = [
        ExerciseInfo(name: "스쿼트", description: "", imageName: "squat"),
        ExerciseInfo(name: "푸쉬업", description: "", imageName: "pushup"),
        ExerciseInfo(name: "런지", description: "", imageName: "lunge")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupUI()
    }
    private func setupNavigationBar() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "탐색"
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground

        view.addSubview(listColllectionView)
        listColllectionView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

extension ExerciseListViewController: 
    UICollectionViewDataSource,
    UICollectionViewDelegate,
    UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return exerciseInfo.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ExerciseListCollectionViewCell.identifier, for: indexPath) as? ExerciseListCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.setInfo(info: exerciseInfo[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let minimunLineSpacing = 10
        return CGSize(
            width: collectionView.bounds.width,
            height: (collectionView.bounds.height - CGFloat(minimunLineSpacing)) / 3
        )
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.delegate?.moveToDetailView(info: exerciseInfo[indexPath.row])
    }
}
