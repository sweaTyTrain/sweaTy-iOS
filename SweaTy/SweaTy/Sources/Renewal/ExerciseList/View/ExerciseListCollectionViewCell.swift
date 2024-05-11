//
//  ExerciseListCollectionViewCell.swift
//  SweaTy
//
//  Created by 이대현 on 4/8/24.
//

import SnapKit
import UIKit

final class ExerciseListCollectionViewCell: UICollectionViewCell {
    private lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "squat")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var translucentView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 1, alpha: 0.6)
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "스쿼트"
        label.textColor = .black
        label.font = .systemFont(ofSize: 32, weight: .bold)
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.backgroundColor = .blue
        self.addSubview(backgroundImageView)
        backgroundImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        self.addSubview(translucentView)
        translucentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        self.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(25)
        }
    }
    
    func setInfo(info: ExerciseInfo) {
        titleLabel.text = info.name
        backgroundImageView.image = UIImage(named: info.imageName)
    }
}
