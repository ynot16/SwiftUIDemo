//
//  ContentView.swift
//  SwiftUIPlayGround
//
//  Created by Wang Wei on 2019/06/18.
//  Copyright © 2019 OneV's Den. All rights reserved.
//

import SwiftUI

//struct ContentView : View {
//    var body: some View {
//        VStack {
//            HStack {
//                Spacer()
//                Text("Some Text")
//                Spacer()
//                }.background(Color.gray)
//            HStack {
//                Spacer()
//                Text("Some Much Longer Text")
//                Spacer()
//                }.background(Color.gray)
//        }.fixedSize()
//    }
//}

extension Text {
    func blueRoundRectWhiteText() -> some View {
        HStack {
            Spacer()
            self.color(.white)
            Spacer()
            }
            .padding().background(Color.blue.cornerRadius(10))
    }
}

struct ContentView1 : View {
    var body: some View {
        return HStack(alignment: .top) {
            VStack {
                Text("Short").blueRoundRectWhiteText()
                Text("The longest text.").blueRoundRectWhiteText()
                Text("Short").blueRoundRectWhiteText()
                }
                .fixedSize()

            VStack {
                bodyText.lineLimit(nil)
            }
        }
    }
}

let bodyText = Text("""
    It is difficult in SwiftUI to have a VStack or HStack shrink to the width \
    or height, respectively, of its largest component but also have elements \
    within each row fill the available width of the VStack or HStack. This \
    package provides an easy solution.
    """)

public extension View {
    @inlinable func fittingContent() -> FittingContent<Self> {
        return FittingContent(self)
    }
}

public extension View {
    @inlinable func fittingSize() -> ConditionallyFixedSize<Self> {
        return ConditionallyFixedSize(self)
    }
}

public struct UseFixedSizes: EnvironmentKey {
    public static let defaultValue: Bool = false
}

public extension EnvironmentValues {
    var useFixedSizes: Bool {
        get { return self[UseFixedSizes.self] }
        set { self[UseFixedSizes.self] = newValue }
    }
}

@available(*, deprecated, message: "Use `fittingContent()` on any self-sizing container view, instead.")
public typealias Fitting = FittingContent

public struct FittingContent<Content: View>: View {
    public let content: Content
    @inlinable public init(_ content: Content) {
        self.content = content
    }
    public var body: some View {
        content
            .environment(\.useFixedSizes, true)
            .hidden()
            .overlay(content.environment(\.useFixedSizes, false))
    }
}

public struct ConditionallyFixedSize<Content: View>: View {
    @Environment(\.useFixedSizes) var useFixedSizes: Bool
    public let content: Content
    @inlinable public init(_ content: Content) {
        self.content = content
    }
    public var body: some View {
        content.fixedSize(horizontal: useFixedSizes, vertical: useFixedSizes)
    }
}

@available(*, deprecated, message: "Use `Spacer().fittingSize()` instead.")
public struct FittingSpacer: View {
    let minLength: Length?
    public init(minLength: Length? = nil) {
        self.minLength = minLength
    }
    public var body: some View {
        Spacer(minLength: minLength).fittingSize()
    }
}

#if DEBUG
struct ContentView1_Previews : PreviewProvider {
    static var previews: some View {
        ContentView1()
    }
}
#endif

struct ModalView: View {
    @Environment(\.isPresented) var isPresented

    var body: some View {
        NavigationView {
            Text("Hello World")
                .font(.caption)
                .navigationBarTitle(Text("Modal Contents"))
                .navigationBarItems(trailing:
                    Button(action: { self.isPresented?.value = false }) { Text("Done") }
                )
        }
    }
}

struct LiveView: View {

    var modalView = ModalView()

    var body: some View {
        NavigationView {
            NavigationLink(destination:
                Text("Hello World")
                    .font(.caption)
                    .navigationBarTitle(Text("Detail View Contents"))
            ) { Text("Show Detail View Show Detail View Show Detail View Show Detail View")

                }
            .navigationBarTitle(Text("Welcome"))
            .navigationBarItems(trailing:
                PresentationButton(destination: Text("Modal"), label: { modalView })
            )

        }
    }
}
