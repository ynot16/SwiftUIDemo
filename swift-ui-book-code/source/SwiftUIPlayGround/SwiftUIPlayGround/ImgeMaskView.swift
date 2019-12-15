//
//  ImgeMaskView.swift
//  SwiftUIPlayGround
//
//  Created by 王 巍 on 2019/06/21.
//  Copyright © 2019 OneV's Den. All rights reserved.
//

import SwiftUI

struct ImgeMaskView : View {
    var body: some View {
        Image("cat_big").resizable().frame(width: 200, height: 30).mask(Text("Hello World").font(.title).fontWeight(.heavy))
    }
}

#if DEBUG
struct ImgeMaskView_Previews : PreviewProvider {
    static var previews: some View {
        ImgeMaskView()
    }
}
#endif
