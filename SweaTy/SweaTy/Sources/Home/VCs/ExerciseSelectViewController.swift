//
//  ExerciseSelectViewController.swift
//  SweaTy
//
//  Created by 이대현 on 2/24/24.
//

import SnapKit
import UIKit

final class ExerciseSelectViewController: UIViewController {
    private lazy var logoLabel : UILabel = {
        let label = UILabel()
        label.text = "SweaTy"
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        return label
    }()
    
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
    }
}
