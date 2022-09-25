//
//  DoctorFormView.swift
//  Healthify
//
//  Created by Khang Nguyen on 9/24/22.
//

import SwiftUI

struct PatientFormView: View {
    @ObservedObject var patientVM = PatientFormViewModel()
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var phoneNumber: String = ""
    var body: some View {
        ZStack {
            Color.healthCream
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 0) {
                Text("Before we start, let's get to know you")
                    .font(.title)
                    .padding(16)
                Spacer()
                Image("businessCard")
                    .resizable()
                    .frame(width: 218, height: 218)
                Spacer()
                
                HStack {
                    Text("First name")
                        .font(.title)
                    Spacer()
                }
                .padding(.horizontal, 16)
                TextField("First name", text: $firstName)
                    .textFieldStyle(RoundedCornerTextFieldStyle())
                    .padding()
                
                HStack {
                    Text("Last name")
                        .font(.title)
                    Spacer()
                }
                .padding(.horizontal, 16)
                TextField("Last name", text: $lastName)
                    .textFieldStyle(RoundedCornerTextFieldStyle())
                    .padding()
                
                NavigationLink(destination: TutorialView(), label: {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 150, height: 74)
                        .foregroundColor(Color.healthOrange)
                        .overlay(content: { Text("Next").font(.title).foregroundColor(.black) })
                        .padding(32)
                })
            }
        }
    }
}

struct PatientFormView_Previews: PreviewProvider {
    static var previews: some View {
        PatientFormView()
    }
}


struct NameAgeForm: View {
    @ObservedObject var patientVM = PatientFormViewModel()
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var phoneNumber: String = ""
    var body: some View {
        ZStack {
            Color.healthCream
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 0) {
                Text("Before we start, let's get to know you")
                    .font(.title)
                    .padding(16)
                Spacer()
                Image("businessCard")
                    .resizable()
                    .frame(width: 218, height: 218)
                Spacer()
                
                HStack {
                    Text("First name")
                        .font(.title)
                    Spacer()
                }
                .padding(.horizontal, 16)
                TextField("First name", text: $firstName)
                    .textFieldStyle(RoundedCornerTextFieldStyle())
                    .padding()
                
                HStack {
                    Text("Last name")
                        .font(.title)
                    Spacer()
                }
                .padding(.horizontal, 16)
                TextField("Last name", text: $lastName)
                    .textFieldStyle(RoundedCornerTextFieldStyle())
                    .padding()
                
                NavigationLink(destination: TutorialView(), label: {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 150, height: 74)
                        .foregroundColor(Color.healthOrange)
                        .overlay(content: { Text("Next").font(.title).foregroundColor(.black) })
                        .padding(32)
                })
            }
        }
    }
}

struct AgeHeightForm: View {
    @ObservedObject var patientVM: PatientFormViewModel
    @State var age: Int = 0
    @State var height: Int = 0
    var body: some View {
        ZStack {
            Color.healthCream
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 0) {
                Text("Before we start, let's get to know you")
                    .font(.title)
                    .padding(16)
                Spacer()
                Image("businessCard")
                    .resizable()
                    .frame(width: 218, height: 218)
                Spacer()
                
                HStack {
                    Text("First name")
                        .font(.title)
                    Spacer()
                }
                .padding(.horizontal, 16)
                
                HStack {
                    Text("Last name")
                        .font(.title)
                    Spacer()
                }
                .padding(.horizontal, 16)
                
                NavigationLink(destination: TutorialView(), label: {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 150, height: 74)
                        .foregroundColor(Color.healthOrange)
                        .overlay(content: { Text("Next").font(.title).foregroundColor(.black) })
                        .padding(32)
                })
            }
        }
    }
}
struct PhoneNumberForm: View {
    @ObservedObject var patientVM: PatientFormViewModel
    @State var age: String = ""
    @State var phoneNum: String = ""
    var body: some View {
        VStack {
            Button("Next"){
            }
        }
    }
}

