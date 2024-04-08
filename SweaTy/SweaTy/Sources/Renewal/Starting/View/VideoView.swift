//
//  VideoView.swift
//  SweaTy
//
//  Created by 이대현 on 4/8/24.
//

import AVKit
import UIKit

final class VideoView: UIView {
    override class var layerClass: AnyClass {
        return AVPlayerLayer.self
    }
    
    var playerLayer: AVPlayerLayer {
        let layer = layer as! AVPlayerLayer
        layer.videoGravity = .resizeAspectFill
        return layer
    }
    
    var player: AVPlayer? {
        get {
            return playerLayer.player
        }
        set {
            playerLayer.player = newValue
        }
    }
}
