//
//  HomeScreenView.swift
//  Healthify
//
//  Created by Khang Nguyen on 9/24/22.
//

import Foundation
import SwiftUI
import Combine

struct HomeScreenView: View {
    var patient: Patient
    @ObservedObject var firstName = TestViewModel()
    var body: some View {
        ZStack {
            Color.healthCream
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    VStack(alignment: .leading, spacing: 0){
                        Text("Good morning,")
                            .font(Font.custom("Nunito-SemiBold", size: 32))
                        Text("\(patient.firstName)!")
                            .font(Font.custom("Nunito-SemiBold", size: 32))
                    }

                    Spacer()
                    Image("skull")
                        .resizable()
                        .frame(width: 86, height: 86)
                        .padding(20)
                }
                .padding()
                
                Text("Checkup")
                    .font(Font.custom("Nunito-Regular", size: 32))
                    .padding(.horizontal)
                Text("You haven't done a checkup yet")
                    .font(Font.custom("Nunito-Regular", size: 20))
                    .padding()
                HStack {
                    NavigationLink(destination: TutorialView(),
                                   label: { Image("startCheckup")
                            .resizable()
                            .frame(width: 136, height: 142)
                    })
                }
                .padding()
                
                Text("Special Options")
                    .font(Font.custom("Nunito-Regular", size: 32))
                    .padding()
                
                HStack {
                    Spacer()
                    Image("lowerBody")
                            .resizable()
                            .frame(width: 168, height: 118)
                    Image("upperBody")
                            .resizable()
                            .frame(width: 168, height: 118)
                    Spacer()
                }
                .padding()
                
                Text("Personal Data")
                    .font(Font.custom("Nunito-Regular", size: 32))
                    .padding()
                
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(Color(red: 1, green: 0.98, blue: 0.62))
                    .frame(width: 263, height: 51)
                    .overlay(Text("Doctor Reports").font(Font.custom("Nunito-Regular", size: 28)))
                    .padding(.horizontal, 24)
            }
        }
    }
}


struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView(patient: Patient())
    }
}

