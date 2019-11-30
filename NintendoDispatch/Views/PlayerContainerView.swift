//
//  PlayerContainerView.swift
//  NintendoDispatch
//
//  Created by Work on 30/11/2019.
//  Copyright © 2019 Limit Break Technology Ltd. All rights reserved.
//

import SwiftUI
import AVFoundation

struct PlayerContainerView : View {
    var url: URL
    private let player: AVPlayer
    
    init(url: URL) {
        self.url = url
        self.player = AVPlayer(url: url)
    }
    
    var body: some View {
    VStack {
      PlayerView(player: player)
      PlayerControlsView(player: player)
    }
  }
}
