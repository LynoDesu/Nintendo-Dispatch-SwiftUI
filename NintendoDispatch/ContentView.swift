//
//  ContentView.swift
//  NintendoDispatch
//
//  Created by Work on 29/11/2019.
//  Copyright © 2019 Limit Break Technology Ltd. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 0
 
    var body: some View {
        TabView(selection: $selection){
            EpisodeList()
                .font(.title)
                .tabItem {
                    VStack {
                        Image("first")
                        Text("Podcasts")
                    }
                }
                .tag(0)
            Text("Articles")
                .font(.title)
                .tabItem {
                    VStack {
                        Image("second")
                        Text("Articles")
                    }
                }
                .tag(1)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
