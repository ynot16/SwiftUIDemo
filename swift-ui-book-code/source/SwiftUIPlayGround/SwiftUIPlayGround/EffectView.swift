//
//  EffectView.swift
//  SwiftUIPlayGround
//
//  Created by 王 巍 on 2019/06/21.
//  Copyright © 2019 OneV's Den. All rights reserved.
//

import SwiftUI

struct EffectView : View {

    @State var scale: CGFloat = 1.0
    @State var rotate: CGFloat = 0.0

    var body: some View {
        VStack {
            Slider(value: $scale, from: 0.1, through: 10.0, by: 0.3)
            Slider(value: $rotate, from: 0, through: 360, by: 1)

            Text("\(scale)")
                .scaleEffect(scale)
                .rotationEffect(Angle(degrees: Double(rotate)))
                .offset(.init(width: 0, height: 100))
        }.padding()
    }
}

#if DEBUG
struct EffectView_Previews : PreviewProvider {
    static var previews: some View {
        EffectView()
    }
}
#endif
