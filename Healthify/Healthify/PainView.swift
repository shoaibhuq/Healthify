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
    @State var problem = ""
    @State var popToRoot = false
    var body: some View {
        VStack {
            List {
                //                Text("Where did you feel the pain?")
                //                    .font(.title)
                Picker("Where did you feel the pain?", selection: $painArea) {
                    Text("Shoulder").tag("Shoulder")
                    Text("Chest").tag("Chest")
                    Text("Forearm").tag("Forearm")
                    Text("Lower back").tag("Lower back")
                    Text("Hip").tag("Hip")
                }
                //                .padding()
                
                
                //                Text("How much pain did you feel?")
                //                    .font(.title)
                //                    .padding()
                Picker("How much pain did you feel?", selection: $painLevel) {
                    ForEach(1...10, id: \.self) {
                        Text("\($0)").tag($0)
                    }
                }
                
                TextField("Any other problem:", text: $problem)
                    .lineLimit(0)
                
                
            }
            if (eventCount < 2) {
                NavigationLink(destination: GuidanceView2(), label: {
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(Color(red: 0.78, green: 0.95, blue: 1))
                        .overlay(Text("Continue?").font(.title))
                        .frame(width: 196, height: 84)
                        .padding()
                })
                Button(action: {
                    eventCount = 0
                    popToRoot = true
                }, label: {
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(.healthOrange)
                        .overlay(Text("Exit").font(.title))
                        .frame(width: 196, height: 84)
                        .padding()
                })
                NavigationLink(destination: HomeScreenView(patient: Patient()).navigationBarBackButtonHidden(true), isActive: $popToRoot, label: { Text("")})
            } else {
                Button(action: {
                    eventCount = 0
                    popToRoot = true
                }, label: {
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(Color(red: 0.78, green: 0.95, blue: 1))
                        .overlay(Text("Submit data").font(.title))
                        .frame(width: 196, height: 84)
                        .padding()
                })
                NavigationLink(destination: HomeScreenView(patient: Patient()).navigationBarBackButtonHidden(true), isActive: $popToRoot, label: { Text("")})
            }
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
                    .frame(width: 196, height: 84)
                    .overlay(Text("Yes").font(.title))
            })
            
            if (eventCount < 2) {
                NavigationLink(destination: GuidanceView2(), label: {
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(Color(red: 0.78, green: 0.95, blue: 1))
                        .frame(width: 196, height: 84)
                        .overlay(Text("No").font(.title))
                })
            } else {
                NavigationLink(destination: HomeScreenView(patient: Patient()).navigationBarBackButtonHidden(true), label: {
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(Color(red: 0.78, green: 0.95, blue: 1))
                        .frame(width: 196, height: 84)
                        .overlay(Text("No").font(.title))
                })
                
                
            }
        }
        .onAppear {
            print(eventCount)
        }
    }
}
    
    struct DataSubmitted: View {
        var body: some View {
            VStack {
                Text("Data has been recorded.")
                    .font(.title)
            }
        }
    }
    
    struct PainView_Previews: PreviewProvider {
        static var previews: some View {
            PainView()
        }
    }
