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
            
        }
    }
}


struct NameAgeForm: View {
    @ObservedObject var patientVM = PatientFormViewModel()
    @State var firstName: String = ""
    @State var lastName: String = ""
//    @State var age: String
    var body: some View {
        VStack {
            
            Text("Enter your first name:")
            TextField("First Name", text: $firstName)
            
            Text("Enter your last name:")
            TextField("Last Name", text: $lastName)
        
            NavigationLink(destination: PhoneNumberForm(patientVM: patientVM)) {
                Text("Next")
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

