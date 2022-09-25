//
//  ContentView.swift
//  Healthify
//
//  Created by Shoaib Huq on 9/24/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            HomeView()
        }
        .preferredColorScheme(.light)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
