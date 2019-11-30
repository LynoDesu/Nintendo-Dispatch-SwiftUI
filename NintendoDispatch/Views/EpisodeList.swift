//
//  EpisodeList.swift
//  NintendoDispatch
//
//  Created by Work on 29/11/2019.
//  Copyright © 2019 Limit Break Technology Ltd. All rights reserved.
//

import SwiftUI

struct EpisodeList: View {
    var body: some View {
            NavigationView {
                VStack{
                    Text("Episodes")
                    .font(.title)
                    .foregroundColor(Color.init(.red))
                    List(episodeData.items) { podcast in
                        NavigationLink(destination: EpisodeDetail(episode: podcast)) {
                            EpisodeRowView(episode: podcast)
                        }
                    }
                }
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .navigationBarHidden(true)
    }
}

struct EpisodeList_Previews: PreviewProvider {
    static var previews: some View {
        EpisodeList()
    }
}
