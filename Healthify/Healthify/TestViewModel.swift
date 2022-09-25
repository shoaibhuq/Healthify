//
//  TestViewModel.swift
//  Healthify
//
//  Created by Shoaib Huq on 9/25/22.
//

import Foundation
import SwiftUI
import Combine

class TestViewModel : ObservableObject {
    private static let userDefaultTextKey = "textKey"
    @Published var text = UserDefaults.standard.string(forKey: TestViewModel.userDefaultTextKey) ?? ""
    private var canc: AnyCancellable!

    init() {
        canc = $text.debounce(for: 0.2, scheduler: DispatchQueue.main).sink { newText in
            UserDefaults.standard.set(newText, forKey: TestViewModel.userDefaultTextKey)
        }
    }

    deinit {
        canc.cancel()
    }
}


