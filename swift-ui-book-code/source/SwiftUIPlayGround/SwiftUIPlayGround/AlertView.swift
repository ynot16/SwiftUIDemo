//
//  Alert.swift
//  SwiftUIPlayGround
//
//  Created by 王 巍 on 2019/06/21.
//  Copyright © 2019 OneV's Den. All rights reserved.
//

import SwiftUI

struct AlertView : View {

    @State var showAlert = false
    @State var showSheet = false

    var body: some View {
        VStack {
            Button(action: {
                self.showAlert.toggle()
            }) {
                Text("Click Me")
                }.presentation($showAlert) {
                    Alert(
                        title: Text("Hello world"),
                        message: Text("Text me"),
                        dismissButton: .cancel()
                    )
            }

            Button(action: {
                self.showSheet.toggle()
            }) {
                Text("Click Me Sheet")
            }.presentation(showSheet ? ActionSheet.init(title: Text("Action Sheet"), message: Text("content"), buttons: [
                ActionSheet.Button.cancel {
                self.showSheet.toggle()
                },
                ActionSheet.Button.default(Text("OKOK"))  {
                    self.showSheet.toggle()
                }
                ]) : nil
            )
        }
    }
}

#if DEBUG
struct AlertView_Previews : PreviewProvider {
    static var previews: some View {
        AlertView()
    }
}
#endif
