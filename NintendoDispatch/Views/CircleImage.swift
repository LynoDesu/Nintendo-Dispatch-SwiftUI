//
//  CircleImage.swift
//  NintendoDispatch
//
//  Created by Work on 30/11/2019.
//  Copyright © 2019 Limit Break Technology Ltd. All rights reserved.
//

import SwiftUI
import URLImage

struct CircleImage: View {
    var url: String
    var body: some View {
        URLImage(URL(string: url)!,
                 delay: 0,
                 processors: [ Resize(size: CGSize(width: 100.0, height: 100.0), scale: UIScreen.main.scale) ],
                 content:  {
                     $0.image
                     .resizable()
                     .aspectRatio(contentMode: .fit)
                     .clipped()
                 })
                     .frame(width: 200.0, height: 200.0)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 10)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(url: "")
    }
}
