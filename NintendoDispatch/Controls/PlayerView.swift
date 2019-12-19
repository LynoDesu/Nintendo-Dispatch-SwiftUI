//
//  PlayerView.swift
//  NintendoDispatch
//
//  Created by Work on 30/11/2019.
//  Copyright © 2019 Limit Break Technology Ltd. All rights reserved.
//

import Foundation
import SwiftUI
import AVFoundation

struct PlayerView: UIViewRepresentable {
    let player: AVPlayer
    
    func updateUIView(_ uiView: UIView, context:
        UIViewRepresentableContext<PlayerView>) {
    }
    
    func makeUIView(context: Context) -> UIView {
        let playerUiView = PlayerUIView(player: player)
        return playerUiView
    }
    
}
