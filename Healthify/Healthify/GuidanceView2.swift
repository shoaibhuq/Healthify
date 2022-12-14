//
//  GuidanceView2.swift
//  Healthify
//
//  Created by Khang Nguyen on 9/25/22.
//

import SwiftUI

struct GuidanceView2: View {
    @ObservedObject var arVM = arContainerModel
    @State var goToPain = false
    var body: some View {
        VStack {
            ARViewContainer()
                .frame(minHeight: 500)
            HStack {
                GifImage("Squat_side_fixed")
                VStack {
                    Spacer()
                    Text("Hip and Lower Back Mobility Test")
                        .padding()
                    Button(action: {
                        eventCount = 2
                        goToPain = true
                    }) {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 146, height: 56)
                            .foregroundColor(.healthOrange)
                            .overlay(Text("I feel pain"))
                            .padding()
                    }
                }
            }
            .frame(height: 200)
            NavigationLink(destination: DidFeelPain(), isActive: $goToPain, label: { Text("") })
        }
        .onChange(of: arVM.transition, perform: { _ in
            if arVM.transition == true {
                print("ASLDKJ")
                soundFlag = true
                arVM.transition = false
                goToPain = true
            }
        })
    }

}
//
//struct GuidanceView2_Previews: PreviewProvider {
//    static var previews: some View {
//        GuidanceView2()
//    }
//}
