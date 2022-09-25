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
        ZStack {
            Color.healthCream
                .edgesIgnoringSafeArea(.all)
            
            Ellipse()
                .fill(Color.healthBlue)
                .frame(width: 221, height: 181)
                .offset(x: -190, y: -460)
            
            Ellipse()
                .fill(Color(UIColor(red: 0.7, green: 0.82, blue: 0.74, alpha: 1)))
                .frame(width: 221, height: 181)
                .offset(x: 250, y: 0)
            
            //Ellipse 1
            Ellipse()
                .fill(LinearGradient(
                        gradient: Gradient(stops: [
                    .init(color: Color(#colorLiteral(red: 0.3137255012989044, green: 0.6980392336845398, blue: 0.7529411911964417, alpha: 1)), location: 0),
                    .init(color: Color(#colorLiteral(red: 0, green: 0.6015625, blue: 0.6875, alpha: 1)), location: 1)]),
                        startPoint: .topTrailing,
                        endPoint: .bottomLeading))
                .frame(width: 765, height: 624)
                .offset(x: -50, y: 450)
            VStack {
                Spacer()
                Image("skull")
                    .resizable()
                    .frame(width: 200, height: 200)
                Text("HEALTHIFY")
                    .font(Font.custom("BeVietnamPro-Medium", size: 36))
                    .tracking(5)
                
                    .padding()
                
                Spacer()
                
                NavigationLink(destination: NameAgeForm(), label: {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 250, height: 74)
                        .foregroundColor(Color.healthOrange)
                        .overlay(content: { Text("Register").font(Font.custom("Nunito-Regular", size: 32)).foregroundColor(.black) })
                })
                NavigationLink(destination: HomeScreenView(patient: PatientFormViewModel().patient), label: {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 200, height: 74)
                        .foregroundColor(Color(UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1)))
                        .overlay(content: { Text("Login").font(Font.custom("Nunito-Regular", size: 28)).foregroundColor(.black) })
                        .padding(16)
                        .padding(.bottom, 32)
                })
                    
            }
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

