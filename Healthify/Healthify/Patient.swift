//
//  DoctorFormModel.swift
//  Healthify
//
//  Created by Khang Nguyen on 9/24/22.
//

import Foundation

struct Patient:Codable {
    
    
    
    var firstName:String = ""
    var lastName:String = ""
    var age: Int = 0
    var height: Int = 0
    var phoneNumber: String = ""
    var email: String = ""
    
    var physicianName: String = ""
    var physicianEmail: String = ""
    
}
