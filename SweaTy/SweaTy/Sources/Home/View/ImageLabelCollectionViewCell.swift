//
//  ImageLabelCollectionViewCell.swift
//  SweaTy
//
//  Created by 이대현 on 3/13/24.
//

import SnapKit
import UIKit

final class ImageLabelCollectionViewCell: UICollectionViewCell {
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "photo")
        return imageView
    }()
    
    private lazy var title: UILabel = {
        let label = UILabel()
        label.text = "스쿼트"
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
        let contentView = ShadowRoundView()
        contentView.setColor(.sweatyGreen)
        addSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        contentView.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(5)
            make.width.equalToSuperview().multipliedBy(0.7)
            make.height.equalTo(imageView.snp.width)
        }
        
        contentView.addSubview(title)
        title.snp.makeConstraints { make in
            make.centerX.equalTo(imageView)
            make.bottom.equalToSuperview().offset(-10)
        }
    }
}
