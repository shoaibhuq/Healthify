//
//  HomeView.swift
//  Healthify
//
//  Created by Khang Nguyen on 9/24/22.
//

import SwiftUI
import Lottie

struct HomeView: View {
    @State var checkupPresented = false
    var body: some View {
        VStack {
            Text("HEALTHIFY")
                .font(.title)

            NavigationLink(destination: AnimationView(), label: { Text("Start checkup") })
        }
    }
}

