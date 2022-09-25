//
//  PainView.swift
//  Healthify
//
//  Created by Khang Nguyen on 9/25/22.
//

import SwiftUI

struct PainView: View {
    @State var painArea = ""
    @State var painLevel = 0
    var body: some View {
        VStack {
            List {
                Text("Where did you feel the pain?")
                    .font(.title)
                Picker("Pain in", selection: $painArea) {
                    Text("Shoulder").tag("Shoulder")
                    Text("Chest").tag("Chest")
                    Text("Forearm").tag("Forearm")
                    Text("Lower back").tag("Lower back")
                    Text("Hip").tag("Hip")
                }
                .padding()
                
                
                Text("How much pain did you feel?")
                    .font(.title)
                    .padding()
                Picker("Pain scale", selection: $painArea) {
                    ForEach(1...10, id: \.self) {
                        Text("\($0)")
                    }
                }
                
                
            }
            
            NavigationLink(destination: PainView(), label: {
                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(Color(red: 0.78, green: 0.95, blue: 1))
                    .overlay(Text("Continue?").font(.title))
                    .frame(width: 196, height: 84)
                    .padding()
            })
            
            NavigationLink(destination: PainView(), label: {
                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(.healthOrange)
                    .overlay(Text("Exit").font(.title))
                    .frame(width: 196, height: 84)
                    .padding()
            })
        }
    }
}
struct DidFeelPain: View {
    var body: some View {
        VStack {
            Text("Did you feel any pain?")
                .font(.title)
                .padding()
            NavigationLink(destination: PainView(), label: {
                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(.healthOrange)
                    .overlay(Text("Yes").font(.title))
            })
            
            NavigationLink(destination: PainView(), label: {
                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(Color(red: 0.78, green: 0.95, blue: 1))
                    .overlay(Text("No").font(.title))
            })
            
        }
    }
}

struct PainView_Previews: PreviewProvider {
    static var previews: some View {
        PainView()
    }
}
