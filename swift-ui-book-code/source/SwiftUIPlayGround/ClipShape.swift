//
//  ClipShape.swift
//  SwiftUIPlayGround
//
//  Created by 王 巍 on 2019/06/21.
//  Copyright © 2019 OneV's Den. All rights reserved.
//

import SwiftUI

struct ClipShape : View {
    var body: some View {
        VStack(spacing: 50) {
            Button(action: {
                print("Clike")
            }) {
                Text("good")
                    .font(.body)
                    .foregroundColor(.black)
                    .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
                    .background(Color.gray)
                    .clipShape(Capsule())

            }
        }
    }
}

#if DEBUG
struct ClipShape_Previews : PreviewProvider {
    static var previews: some View {
        ClipShape()
    }
}
#endif
