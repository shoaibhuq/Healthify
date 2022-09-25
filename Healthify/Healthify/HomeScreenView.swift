//
//  HomeScreenView.swift
//  Healthify
//
//  Created by Khang Nguyen on 9/24/22.
//

import Foundation
import SwiftUI

struct HomeScreenView: View {
    var patient: Patient
    var body: some View {
        ZStack {
            Color.healthCream
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    Text("Hello \(patient.firstName)!!")
                        .font(.title)
                    Spacer()
                    Image("skull")
                        .resizable()
                        .frame(width: 86, height: 86)
                }
                .padding()
                
                Text("Checkup")
                    .font(.title)
                    .padding(.horizontal)
                Text("You haven't done a checkup yet")
                    .font(.footnote)
                    .padding()
                HStack {
                    NavigationLink(destination: EmptyView(),
                                   label: { Image("startCheckup")
                            .resizable()
                            .frame(width: 136, height: 142)
                    })
                }
                .padding()
                
                Text("Special Options")
                    .font(.title)
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
                    .font(.title)
                    .padding()
                
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(Color(red: 0.98, green: 0.667, blue: 0.55))
                    .frame(width: 263, height: 51)
                    .overlay(Text("Muscle Health").font(.title2))
                    .padding(.horizontal, 32)
                
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(Color(red: 1, green: 0.98, blue: 0.62))
                    .frame(width: 263, height: 51)
                    .overlay(Text("Doctor Reports").font(.title2))
                    .padding(.horizontal, 16)
                    .padding()
            }
        }
    }
}


struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView(patient: Patient())
    }
}

