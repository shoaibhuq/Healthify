//
//  TextFieldStyle+RoundedCorner.swift
//  Healthify
//
//  Created by Khang Nguyen on 9/24/22.
//

import Foundation
import SwiftUI

struct RoundedCornerTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(10)
            .background(RoundedRectangle(cornerRadius: 10)
                .frame(height: 55)
                .foregroundColor(.white))
    }
}
