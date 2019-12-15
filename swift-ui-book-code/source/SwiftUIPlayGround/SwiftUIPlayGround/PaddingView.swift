//
//  ContentView.swift
//  SwiftUIPlayGround
//
//  Created by Wang Wei on 2019/06/18.
//  Copyright © 2019 OneV's Den. All rights reserved.
//

import SwiftUI
import Combine

struct PaddingView : View {
    var body: some View {
        VStack(alignment: .trailing, spacing: 30) {
            Text("Hello")
            Text("SwiftUI")
        }
            .background(Color.red)
            .padding()
            .background(Color.blue)
    }
}

#if DEBUG
struct ContentView2_Previews : PreviewProvider {
    static var previews: some View {
        PaddingView()
    }
}
#endif
