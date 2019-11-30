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
    @State var playEpisode = false
    var body: some View {
        let index = episode.id.index(episode.id.startIndex, offsetBy: 1)
        let mySubstring = episode.id[..<index]
        let headerUrl = "https://assets.fireside.fm/file/fireside-images/podcasts/images/b/bd6e0af5-b1d6-4783-9506-d534cfbae69e/episodes/\(mySubstring)/\(episode.id)/header.jpg"
        
        return VStack(alignment: .center, spacing: 20) {
            CircleImage(url: headerUrl)
                .offset(x: 0, y: -20)
            
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
            .padding()
            
            Text(episode.summary)
                .font(.body)
                .padding(EdgeInsets.init(top: 20, leading: 0, bottom: 0, trailing: 0))
                
            Button(action: {
            }){Text("Play episode")}
            PlayerView(url: URL(string: self.episode.attachments[0].url)!)
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
