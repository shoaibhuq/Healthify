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
            HStack {
                GifImage("Squat_side_fixed")
                VStack {
                    Text("Hip and Lower Back Mobility Test")
                    Button(action: { goToPain = true }) {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 146, height: 56)
                            .foregroundColor(.healthOrange)
                    }
                }
            }
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
