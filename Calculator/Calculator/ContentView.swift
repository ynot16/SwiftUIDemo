//
//  ContentView.swift
//  Calculator
//
//  Created by ali on 2019/12/14.
//  Copyright © 2019 com.alibaba.www. All rights reserved.
//

import SwiftUI

let scale: CGFloat = UIScreen.main.bounds.width / 414

struct ContentView: View {
    
    var body: some View {
        VStack(alignment: .center, spacing: 12) {
            Spacer()
            Text("1234567890")
                .font(.system(size: 76))
                .minimumScaleFactor(0.5)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                .lineLimit(1)
            CalculatorButtonPad()
                .padding(.bottom)
        }
        .scaleEffect(scale)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
//            ContentView().previewDevice("iPhone SE")
        }
    }
}

struct CalculatorButton: View {
    let fontSize: CGFloat = 38
    let title: String
    let size: CGSize
    let backgroundColorName: String
    let action: () -> Void
    
    var body: some View {
//        Button(action: action) {
//            Text(title)
//                .font(.system(size: fontSize))
//                .foregroundColor(.white)
//                .frame(width: size.width, height: size.height, alignment: .center)
//                .background(Color(backgroundColorName))
//                .cornerRadius(size.width / 2)
//        }
        ZStack {
//            Circle()
            RoundedRectangle(cornerRadius: size.height / 2, style: .circular)
                .frame(width: size.width, height: size.height, alignment: .center)
                .foregroundColor(Color(backgroundColorName))
                .onTapGesture {
                    self.action()
            }
            Text(title)
            .font(.system(size: fontSize))
            .foregroundColor(.white)
            .frame(width: size.width, height: size.height, alignment: .center)
        }
    }
}

struct CalculatorButtonRow: View {
    
    let row: [CaculatorButtonItem]
    var body: some View {
        HStack {
            ForEach(row, id: \.self) { item in
                CalculatorButton(title: item.title, size: item.size, backgroundColorName: item.backgroundColorName) {
                    print("Button: \(item.title)")
                }
            }
        }
    }
}

struct CalculatorButtonPad: View {
    let pad: [[CaculatorButtonItem]] = [
        [.command(.clear), .command(.flip), .command(.percent), .op(.divide)],
        [.digit(7), .digit(8), .digit(9), .op(.multiply)],
        [.digit(4), .digit(5), .digit(6), .op(.minus)],
        [.digit(1), .digit(2), .digit(3), .op(.plus)],
        [.digit(0), .dot, .op(.equal)]
    ]
    
    var body: some View {
        VStack(alignment: .center, spacing: 8) {
            ForEach(pad, id: \.self) { row in
                CalculatorButtonRow(row: row)
            }
        }
    }
}
