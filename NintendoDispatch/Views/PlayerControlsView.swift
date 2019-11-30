//
//  PlayerControlsView.swift
//  NintendoDispatch
//
//  Created by Work on 30/11/2019.
//  Copyright © 2019 Limit Break Technology Ltd. All rights reserved.
//

import SwiftUI
import AVFoundation

struct PlayerControlsView : View {
    @State var playerPaused = true
    let player: AVPlayer
    
    var body: some View {
      Button(action: {
        self.playerPaused.toggle()
        if self.playerPaused {
          self.player.pause()
        }
        else {
          self.player.play()
        }
      }) {
        Image(systemName: playerPaused ? "play" : "pause")
      }
    }
}
