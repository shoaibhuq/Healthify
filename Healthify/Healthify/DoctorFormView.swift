//
//  DoctorFormView.swift
//  Healthify
//
//  Created by Khang Nguyen on 9/24/22.
//

import SwiftUI

struct DoctorFormView: View {
    @State var firstName: String
    @State var lastName: String
    @State var phoneNumber: String
    var body: some View {
        VStack {
            Image
            
            Text("Enter your first name:")
            TextField("First Name", text: $firstName)
            
            Text("Enter your last name:")
            TextField("Last Name", text: $lastName)
            
            Text("Enter your phone number")
            TextField("Phone Number", text: $phoneNumber)
            
            Text("Enter your ")
            
            Button("Save") {
                // user default the thing
            }
            Text
        }
    }
}


struct NameAgeForm: View {
    @State var firstName: String
    @State var lastName: String
    @State var age: String
    @State var patient = Patient()
    var body: some View {
        VStack {
            
            Text("Enter your first name:")
            TextField("First Name", text: $firstName)
            
            Text("Enter your last name:")
            TextField("Last Name", text: $lastName)
            
            Text("Enter your age")
            TextField("Age", text: $lastName)
            
            Button("Next"){
                patient.firstName = firstName
                patient.lastName = lastName
                patient.age = age
                
            }
        }
    }
}

struct PhoneNumberForm: View {
    @State var firstName: String
    @State var lastName: String
    @State var age: String
    @State var patient: Patient
    var body: some View {
        VStack {
            
            Text("Enter your first name:")
            TextField("First Name", text: $firstName)
            
            Text("Enter your last name:")
            TextField("Last Name", text: $lastName)
            
            Text("Enter your age:")
            TextField("Age", text: $age)
            
            Button("Next"){
                patient
            }
        }
    }
}

