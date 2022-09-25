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
    @State var moveNext = false
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
                
                Button(action: {
                    patientVM.patient.firstName = firstName
                    patientVM.patient.lastName = lastName
                    moveNext = true
                }, label: {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 150, height: 74)
                        .foregroundColor(Color.healthOrange)
                        .overlay(content: { Text("Next").font(.title).foregroundColor(.black) })
                        .padding(32)
                })
                NavigationLink(destination: AgeHeightForm(patientVM: patientVM), isActive: $moveNext, label: {EmptyView()} )
            }
        }
    }
}

struct AgeHeightForm: View {
    @ObservedObject var patientVM: PatientFormViewModel
    @State var age: Int = 0
    @State var height: Int = 0
    @State var moveNext = false
    var body: some View {
        ZStack {
            Color.healthCream
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 0) {
                Text("Just a little more information")
                    .font(.title)
                    .padding(16)
                Spacer()
                Image("businessCard")
                    .resizable()
                    .frame(width: 218, height: 218)
                Spacer()
                
                HStack {
                    Text("Age")
                        .font(.title)
                    Spacer()
                }
                .padding(.horizontal, 16)
                TextField("Age", value: $age, format: .number)
                    .textFieldStyle(RoundedCornerTextFieldStyle())
                    .padding()
                HStack {
                    Text("Height")
                        .font(.title)
                    Spacer()
                }
                .padding(.horizontal, 16)
                
                TextField("Height", value: $height, format: .number)
                    .textFieldStyle(RoundedCornerTextFieldStyle())
                    .padding()
                
                
                Button(action: {
                    patientVM.patient.age = age
                    patientVM.patient.height = height
                    moveNext = true
                }, label: {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 150, height: 74)
                        .foregroundColor(Color.healthOrange)
                        .overlay(content: { Text("Next").font(.title).foregroundColor(.black) })
                        .padding(32)
                })
                NavigationLink(destination: PhoneEmailForm(patientVM: patientVM), isActive: $moveNext, label: {EmptyView()} )
            }
        }
    }
}

struct PhoneEmailForm: View {
    @ObservedObject var patientVM: PatientFormViewModel
    @State var phoneNumber = ""
    @State var email = ""
    @State var moveNext = false
    var body: some View {
        ZStack {
            Color.healthCream
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 0) {
                Text("Almost there")
                    .font(.title)
                    .padding(16)
                Spacer()
                Image("businessCard")
                    .resizable()
                    .frame(width: 218, height: 218)
                Spacer()
                
                HStack {
                    Text("Phone Number")
                        .font(.title)
                    Spacer()
                }
                .padding(.horizontal, 16)
                TextField("Phone Number", text: $phoneNumber)
                    .textFieldStyle(RoundedCornerTextFieldStyle())
                    .padding()

                HStack {
                    Text("Email")
                        .font(.title)
                    Spacer()
                }
                .padding(.horizontal, 16)
                TextField("personal@domain.com", text: $email)
                    .textFieldStyle(RoundedCornerTextFieldStyle())
                    .padding()
                
                Button(action: {
                    patientVM.patient.phoneNumber = phoneNumber
                    patientVM.patient.email = email
                    moveNext = true
                }, label: {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 150, height: 74)
                        .foregroundColor(Color.healthOrange)
                        .overlay(content: { Text("Next").font(.title).foregroundColor(.black) })
                        .padding(32)
                })
                NavigationLink(destination: PhysicianForm(patientVM: patientVM), isActive: $moveNext, label: {EmptyView()} )
            }
        }
    }
}


struct PhysicianForm: View {
    @ObservedObject var patientVM: PatientFormViewModel
    @State var physicianName = ""
    @State var physicianEmail = ""
    @State var moveNext = false
    var body: some View {
        ZStack {
            Color.healthCream
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 0) {
                Text("Last part, I promise")
                    .font(.title)
                    .padding(16)
                Spacer()
                Image("businessCard")
                    .resizable()
                    .frame(width: 218, height: 218)
                Spacer()
                
                HStack {
                    Text("Primary Care Physician")
                        .font(.title)
                    Spacer()
                }
                .padding(.horizontal, 16)
                TextField("First / Last name", text: $physicianName)
                    .textFieldStyle(RoundedCornerTextFieldStyle())
                    .padding()

                HStack {
                    Text("Physician Email")
                        .font(.title)
                    Spacer()
                }
                .padding(.horizontal, 16)
                TextField("physician@domain.com", text: $physicianEmail)
                    .textFieldStyle(RoundedCornerTextFieldStyle())
                    .padding()
                
                Button(action: {
                    patientVM.patient.physicianName = physicianName
                    patientVM.patient.physicianEmail = physicianEmail
                    patientVM.save()
                    moveNext = true
                }, label: {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 150, height: 74)
                        .foregroundColor(Color.healthOrange)
                        .overlay(content: { Text("Next").font(.title).foregroundColor(.black) })
                        .padding(32)
                })
                NavigationLink(destination: PhoneEmailForm(patientVM: patientVM), isActive: $moveNext, label: {EmptyView()} )
            }
        }
    }
}