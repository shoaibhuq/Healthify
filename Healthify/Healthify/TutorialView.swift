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
        ZStack {
            VStack(spacing: 0) {
                GifImage("Squat_side_fixed")
//                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Spacer()
                    HStack {
                        Image("list")
                            .resizable()
                            .frame(width: 107, height: 107)
                        VStack(alignment: .leading, spacing: 0) {
                            Text("Shoulder Mobility Test")
                                .font(.title)
                            Group {
                                Text("1. Start with hands at the hips")
                                Text("2. Follow the animation")
                                Text("3. Take it slow")
                                Text("4. If you feel pain press the “I feel pain” option")
                            }
                            .font(.body)
                            .padding(2)
                        }
                    }
                    
                    
                    NavigationLink(destination:
                            GuidanceView()
                    ) {
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundColor(Color(red: 0.48, green: 0.37, blue: 0.82))
                            .frame(width: 196, height: 84)
                            .overlay(Text("Start").font(.title).foregroundColor(.white))
                            .padding()
                    }
                    Spacer()
                }
    //            .frame(height: 330)
//                .background(Color(red: 0.78, green: 0.95, blue: 1))
                
            }
        }
    }
}


struct TutorialView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialView()
    }
}
