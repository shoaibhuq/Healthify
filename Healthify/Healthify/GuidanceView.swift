//
//  GuidanceView.swift
//  Healthify
//
//  Created by Khang Nguyen on 9/24/22.
//

import SwiftUI

struct GuidanceView: View {
    @ObservedObject var arVM = arContainerModel
    @State var goToPain = false
    var body: some View {
        VStack {
            ARViewContainer()
            HStack {
                GifImage("ArmSwing_fixed")
                    .frame(minHeight: 700)
                VStack {
                    Text("Shoulder Mobility Test")
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

//struct GuidanceView_Previews: PreviewProvider {
//    static var previews: some View {
//        GuidanceView()
//    }
//}
