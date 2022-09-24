//
//  AnimationView.swift
//  Healthify
//
//  Created by Khang Nguyen on 9/24/22.
//

import SwiftUI

struct AnimationView: View {
    @State var checkupPresented = false
    var body: some View {
        VStack {
            LottieView(name: "AHLSDFS")
            Text("sldafkjdslafkj")
            Text("sldafkjdslafkj")
            Text("sldafkjdslafkj")
            NavigationLink(destination:
                ZStack {
                    ARViewContainer()
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

struct AnimationView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationView()
    }
}
