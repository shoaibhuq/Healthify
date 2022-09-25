//
//  GuidanceView.swift
//  Healthify
//
//  Created by Khang Nguyen on 9/24/22.
//

import SwiftUI

struct GuidanceView: View {
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
    }
}

//struct GuidanceView_Previews: PreviewProvider {
//    static var previews: some View {
//        GuidanceView()
//    }
//}
