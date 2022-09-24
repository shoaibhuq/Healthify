//
//  HomeView.swift
//  Healthify
//
//  Created by Khang Nguyen on 9/24/22.
//

import SwiftUI

struct HomeView: View {
    @State var checkupPresented = false
    var body: some View {
        VStack {
            Text("HEALTHIFY")
                .font(.title)
            
            Button("YO") {
                checkupPresented.toggle()
            }
            
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
                Text("Run checkup")
            }
            
        }
    }
}

