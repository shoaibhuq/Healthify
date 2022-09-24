//
//  DoctorFormView.swift
//  Healthify
//
//  Created by Khang Nguyen on 9/24/22.
//

import SwiftUI

struct DoctorFormView: View {
    @State var name: String
    var body: some View {
        VStack {
            TextField("Enter your name", text: $name)
            Button("Save") {
                // user default the thing
                let form = DoctorFormModel(name: name, age: 0, height: 0)
            }
        }
    }
}

