//
//  ContentView.swift
//  Calculator
//
//  Created by ali on 2019/12/14.
//  Copyright © 2019 com.alibaba.www. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            Button(action: {
                print("button: +1")
            }) {
                Text("1")
                .font(.system(size: 38))
                .foregroundColor(.white)
                .frame(width: 88, height: 88, alignment: .center)
                .background(Color("digitBackground"))
                .cornerRadius(44)
            }
            Button(action: {
                print("button: 2")
            }) {
                Text("2")
                .font(.system(size: 38))
                .foregroundColor(.white)
                .frame(width: 88, height: 88, alignment: .center)
                .background(Color("digitBackground"))
                .cornerRadius(44)
            }
            Button(action: {
                print("button: 3")
            }) {
                Text("3")
                .font(.system(size: 38))
                .foregroundColor(.white)
                .frame(width: 88, height: 88, alignment: .center)
                .background(Color("digitBackground"))
                .cornerRadius(44)
            }
            Button(action: {
                print("button: +")
            }) {
                Text("+")
                .font(.system(size: 38))
                .foregroundColor(.white)
                .frame(width: 88, height: 88, alignment: .center)
                .background(Color("operatorBackground"))
                .cornerRadius(44)
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
