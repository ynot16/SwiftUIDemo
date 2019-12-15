//
//  ContentView.swift
//  SwiftUIPlayGround
//
//  Created by 王 巍 on 2019/06/19.
//  Copyright © 2019 OneV's Den. All rights reserved.
//

import SwiftUI

struct ViewLifeCycle : View {

    var body: some View {
        NavigationView {
            VStack {
                List((1..<100).identified(by: \.self)) { v in
                    Text(String(v))
                        .font(.title).onAppear {
//                            Swift.print("Cell appear \(v)")
                        }
                        .onDisappear {
//                            Swift.print("Cell disaapear \(v)")
                        }
                }

                NavigationLink(destination: DetailView()) {
                    Text("Detail")
                }
//                    .onAppear {
//                        print("Master appear")
//                    }
//                    .onDisappear {
//                        print("Master disaapear")
//                }
            }.navigationBarTitle(Text("Hello"))
        }
    }
}

struct DetailView: View {
    var body: some View {
        Text("hello")
            .onAppear {
                print("Detail appear")
            }
            .onDisappear {
                print("Detail disaapear")
            }
    }
}

#if DEBUG
struct ViewLifeCycle_Previews : PreviewProvider {
    static var previews: some View {
        Group {
            ViewLifeCycle()
            ViewLifeCycle()
        }
    }
}
#endif
