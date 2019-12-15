//
//  TypeEraseView.swift
//  SwiftUIPlayGround
//
//  Created by Wang Wei on 2019/06/25.
//  Copyright © 2019 OneV's Den. All rights reserved.
//

import SwiftUI

extension View {
    /// Returns a type-erased version of the view.
    public var typeErased: AnyView { AnyView(self) }
}

struct TypeEraseView : View {
    var body: some View {
        let core = Text("hello").typeErased
        [Color.red, .orange, .yellow].reduce(core) { view, color in
            view.padding().background(color).typeErased
        }
        return core
    }
}

#if DEBUG
struct TypeEraseView_Previews : PreviewProvider {
    static var previews: some View {
        TypeEraseView()
    }
}
#endif
