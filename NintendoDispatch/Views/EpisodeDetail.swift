//
//  EpisodeDetail.swift
//  NintendoDispatch
//
//  Created by Work on 29/11/2019.
//  Copyright © 2019 Limit Break Technology Ltd. All rights reserved.
//

import SwiftUI
import AVFoundation
import URLImage

struct EpisodeDetail: View {
    var episode: Item
    var body: some View {
        let index = episode.id.index(episode.id.startIndex, offsetBy: 1)
        let mySubstring = episode.id[..<index]
        let headerUrl = "https://assets.fireside.fm/file/fireside-images/podcasts/images/b/bd6e0af5-b1d6-4783-9506-d534cfbae69e/episodes/\(mySubstring)/\(episode.id)/header.jpg"
        
        return VStack(alignment: .center, spacing: 10) {
            CircleImage(url: headerUrl)
            
            Text(episode.title)
                .font(.title)
                .bold()
            
            HStack(alignment: .top) {
                Text("Duration:\(episode.attachments[0].durationInSeconds/60) minutes")
                    .font(.subheadline)
                Spacer()
                Text(episode.datePublished)
                    .font(.subheadline)
            }
            
            Text(episode.summary)
                .font(.body)
                .padding(EdgeInsets.init(top: 20, leading: 0, bottom: 0, trailing: 0))
                
            Button(action: {
                let url = URL(string: self.episode.attachments[0].url)!
                let player = AVPlayer(url: url)
                player.play()
            }){Text("Play episode")}
            
                Spacer()
            }
            .padding()
    }
}


struct EpisodeDetail_Preview: PreviewProvider {
    static var previews: some View {
        EpisodeDetail(episode: episodeData.items[0])
    }
}
