//
//  PatientFormViewModel.swift
//  Healthify
//
//  Created by Khang Nguyen on 9/24/22.
//

import Foundation

class PatientFormViewModel: ObservableObject {
    @Published var patient = Patient()
    
    init() {
        if let data = UserDefaults.standard.data(forKey: "Patient") {
            if let decoded = try? JSONDecoder().decode(Patient.self, from: data) {
                patient = decoded
                return
            }
        }
        patient = Patient()
    }
    func save() {
        if let encoded = try? JSONEncoder().encode(patient) {
            UserDefaults.standard.set(encoded, forKey: "Patient")
        }
    }
}
