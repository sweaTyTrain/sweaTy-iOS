//
//  ExerciseDetailViewController.swift
//  SweaTy
//
//  Created by 이대현 on 4/10/24.
//

import AVFoundation
import SnapKit
import UIKit

protocol ExerciseDetailViewControllerDelegate: AnyObject {
    func moveToPrepareView()
}

final class ExerciseDetailViewController: UIViewController {
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
        label.text = "스쿼트"
        label.font = .systemFont(ofSize: 32)
        label.textColor = .white
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "스쿼트(영어: squat, 표준어: 스쾃)는 웨이트 트레이닝의 가장 대표적인 운동 중 하나이며, 데드리프트, 벤치 프레스와 함께 웨이트 트레이닝의 트로이카 운동으로 꼽힌다. 중량을 겨루는 스포츠인 파워리프팅 중 하나이다. 바벨 또는 덤벨을 들고 무릎 관절을 굽혔다 펴는 행동을 반복함으로써, 하반신의 대퇴사두근과 하퇴삼두근, 대둔근, 중전근 등의 근육을 성장시키는 운동으로, 하체의 근육량 증가에 커다란 효과가 있다."
        label.font = .systemFont(ofSize: 17)
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
            self?.delegate?.moveToPrepareView()
        }, for: .touchUpInside)
        return button
    }()
    
    weak var delegate: ExerciseDetailViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupVideo()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    private func setupUI() {
        view.addSubview(videoView)
        videoView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        view.addSubview(translucentView)
        translucentView.snp.makeConstraints { make in
            make.edges.equalTo(videoView)
        }
        
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.centerY).offset(-100)
            make.left.equalTo(view.safeAreaLayoutGuide).offset(30)
        }
        
        view.addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.left.equalTo(titleLabel)
            make.right.equalTo(view.safeAreaLayoutGuide).offset(-30)
        }
        
        view.addSubview(startButton)
        startButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-30)
            make.left.equalTo(view.safeAreaLayoutGuide).offset(17)
            make.right.equalTo(view.safeAreaLayoutGuide).offset(-17)
            make.height.equalTo(75)
        }
    }
    
    private func setupVideo() {
        let path: String? = Bundle.main.path(forResource: "main_video", ofType: "mp4")
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
}
