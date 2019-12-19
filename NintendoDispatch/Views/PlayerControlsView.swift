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
    @State var seekPos: Double = 0.0
    @State var isBuffering: Bool = false
    
    let player: AVPlayer
    
    init(player: AVPlayer) {
        self.player = player

    }
    
    var body: some View {
        HStack {
            Button(action: {
                self.playerPaused.toggle()
                if self.playerPaused {
                  self.player.pause()
                }
                else {
                  self.player.play()
                }
            })
            {
                Image(systemName: playerPaused ? "play" : "pause")
                .padding(.trailing, 20)
                .padding(.leading, 20)
            }
            Slider(value: $seekPos, in: 0...1, onEditingChanged:
            { _ in
               guard let item = self.player.currentItem else {
                 return
               }
        
               let targetTime = self.seekPos * item.duration.seconds
               self.player.seek(to: CMTime(seconds: targetTime, preferredTimescale: 600))
             })
                .padding(.trailing, 20)
                .padding(.leading, 20)
            ActivityIndicator(isAnimating: $isBuffering, style: .large)
            Text(getTimeText())
        }
    }
    
    func getTimeText() -> String {
        if (self.player.currentItem == nil) {
            return "0:00"
        }
        else
        {
            let seconds = $seekPos.wrappedValue * self.player.currentItem!.duration.seconds
            
            if seconds.isNaN {
                return "0:00"
            }
            
            let (h, m, s) = secondsToHoursMinutesSeconds (seconds: Int(seconds))
            return ("\(h):\(m):\(s)")
        }
        
        
    }
    
    func secondsToHoursMinutesSeconds (seconds : Int) -> (Int, Int, Int) {
      return (seconds / 3600, (seconds % 3600) / 60, (seconds % 3600) % 60)
    }

    func VPNDidChangeStatus(_ notification: Notification) {


    }
}
