//
//  EpisodeRowView.swift
//  NintendoDispatch
//
//  Created by Work on 29/11/2019.
//  Copyright © 2019 Limit Break Technology Ltd. All rights reserved.
//

import SwiftUI
import URLImage

struct EpisodeRowView: View {
    var episode : Item
    
    var body: some View {
        let index = episode.id.index(episode.id.startIndex, offsetBy: 1)
        let mySubstring = episode.id[..<index]
        let url = URL(string: "https://assets.fireside.fm/file/fireside-images/podcasts/images/b/bd6e0af5-b1d6-4783-9506-d534cfbae69e/episodes/\(mySubstring)/\(episode.id)/header.jpg")!
        
        return HStack {
            URLImage(url,
            delay: 0,
            processors: [ Resize(size: CGSize(width: 150.0, height: 100.0), scale: UIScreen.main.scale) ],
            content:  {
                $0.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipped()
            })
                .frame(width: 150.0, height: 100.0)
                .cornerRadius(5.0)
            
            VStack{
                Text(episode.title)
                .bold()
                .lineLimit(2)
                .truncationMode(.tail)
            }
        }
    }
}

struct EpisodeRowView_Previews: PreviewProvider {
    static var previews: some View {
        EpisodeRowView(episode: episodeData.items[0])
            .previewLayout(.fixed(width: 800, height: 100))
    }
}
