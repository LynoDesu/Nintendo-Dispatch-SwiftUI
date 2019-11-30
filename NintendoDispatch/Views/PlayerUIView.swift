//
//  PlayerUIView.swift
//  NintendoDispatch
//
//  Created by Work on 30/11/2019.
//  Copyright © 2019 Limit Break Technology Ltd. All rights reserved.
//

import Foundation
import SwiftUI
import AVFoundation

class PlayerUIView: UIView {
    var url: URL?
    private let playerLayer = AVPlayerLayer()
    
    init(player: AVPlayer) {
        super.init(frame: .zero)
      
      playerLayer.player = player
      layer.addSublayer(playerLayer)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer.frame = bounds
    }
    
    func setUrl(url: URL) -> Void {
        playerLayer.player?.replaceCurrentItem(with: AVPlayerItem(url: url))
        playerLayer.player?.play()
    }
}
