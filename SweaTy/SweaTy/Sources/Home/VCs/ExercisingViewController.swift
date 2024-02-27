//
//  ExercisingViewController.swift
//  SweaTy
//
//  Created by 이대현 on 2/26/24.
//

import SnapKit
import UIKit

protocol ExercisingViewControllerDelegate: AnyObject {
    func moveResultView()
}

final class ExercisingViewController: UIViewController {
    private lazy var finishButton: UIButton = {
        var config = UIButton.Configuration.filled()
        config.background.backgroundColor = .red
        config.baseForegroundColor = .white
        var titleContainer = AttributeContainer()
        titleContainer.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        config.attributedTitle = AttributedString("종료", attributes: titleContainer)
        let button = UIButton()
        button.configuration = config
        button.addAction(UIAction { [weak self] _ in
            self?.delegate?.moveResultView()
        }, for: .touchUpInside)
        return button
    }()
    
    weak var delegate: ExercisingViewControllerDelegate? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        self.setupUI()
    }
    
    private func setupUI() {
        view.addSubview(finishButton)
        finishButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalTo(50)
            make.width.equalTo(100)
        }
    }
}
