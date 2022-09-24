//
//  AnimationView.swift
//  Healthify
//
//  Created by Khang Nguyen on 9/24/22.
//

import SwiftUI

struct TutorialView: View {
    @State var checkupPresented = false
    var body: some View {
        VStack {
//            LottieView(name: "lottie.json")
            GifImage("ThuNha")
            Text("sldafkjdslafkj")
            Text("sldafkjdslafkj")
            Text("sldafkjdslafkj")
            NavigationLink(destination:
                ZStack {
                    EmptyView()
//                    ARViewContainer()
                        .edgesIgnoringSafeArea(.all)
                    Button("OFF") {
                        checkupPresented.toggle()
                    }
                }
                .navigationViewStyle(.stack)
            ) {
                Text("START")
            }
        }
    }
}

