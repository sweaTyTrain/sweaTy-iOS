//
//  StartingViewController.swift
//  SweaTy
//
//  Created by 이대현 on 4/8/24.
//

import AVFoundation
import SnapKit
import UIKit

protocol StartingViewControllerDelegate: AnyObject {
    func moveToListView()
}

final class StartingViewController: UIViewController {
    private lazy var videoView: VideoView = {
        let videoView = VideoView()
        return videoView
    }()
    
    private lazy var translucentView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0, alpha: 0.6)
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "고민은 시간만 늦출 뿐!\nSweaty AI 트레이너와 함께 달려볼까요?"
        label.font = .systemFont(ofSize: 32)
        label.textColor = .white
        return label
    }()
    
    private lazy var startButton: UIButton = {
        let button = UIButton()
        var titleAttr = AttributedString.init("시작하기")
        titleAttr.font = .systemFont(ofSize: 25)
        button.setAttributedTitle(
            NSAttributedString(titleAttr),
            for: .normal
        )
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 35
        button.layer.cornerCurve = .continuous
        button.addAction(UIAction { [weak self] _ in
            print(self?.delegate)
            self?.delegate?.moveToListView()
//            let listVC = ExerciseListViewController()
//            self?.navigationController?.pushViewController(listVC, animated: true)
        }, for: .touchUpInside)
        return button
    }()
    
    var delegate: StartingViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupVideo()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    private func setupVideo() {
        let path: String? = Bundle.main.path(forResource: "nike", ofType: "mp4")
        let url = NSURL(fileURLWithPath: path!)
        videoView.player = AVPlayer(url: url as URL)
        videoView.player?.play()
        videoView.player?.isMuted = true
        
        // Loop video notification
        NotificationCenter.default.addObserver(
            forName: .AVPlayerItemDidPlayToEndTime,
            object: videoView.player?.currentItem,
            queue: .main
        ) { [weak self] _ in
            guard let self = self, let player = videoView.player else { return }
            player.seek(to: .zero)
            player.play()
        }
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(videoView)
        videoView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        view.addSubview(translucentView)
        translucentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        view.addSubview(startButton)
        startButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-30)
            make.left.equalTo(view.safeAreaLayoutGuide).offset(17)
            make.right.equalTo(view.safeAreaLayoutGuide).offset(-17)
            make.height.equalTo(75)
        }
        
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.bottom.equalTo(startButton.snp.top).offset(-110)
            make.left.right.equalTo(startButton)
        }
    }
}
