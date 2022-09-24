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
        
    }
    func save() {
//    save to user default
    }
}
