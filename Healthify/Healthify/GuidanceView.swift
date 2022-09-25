//
//  GuidanceView.swift
//  Healthify
//
//  Created by Khang Nguyen on 9/24/22.
//

import SwiftUI

struct GuidanceView: View {
    @ObservedObject var arVM = arContainerModel
    var body: some View {
        VStack {
//            ARViewContainer()
            HStack {
                GifImage("ThuNha")
                VStack {
                    Text("Shoulder Mobility Test")
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 146, height: 56)
                        .foregroundColor(.healthOrange)
                }
            }
        }
        .onChange(of: arVM.transition, perform: { _ in print("ASLDKJ") })
    }

}

//struct GuidanceView_Previews: PreviewProvider {
//    static var previews: some View {
//        GuidanceView()
//    }
//}
