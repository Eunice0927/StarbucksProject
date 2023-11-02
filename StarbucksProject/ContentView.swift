//
//  ContentView.swift
//  StarbucksProject
//
//  Created by Eunsu JEONG on 11/2/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct Beverage: Codable, Identifiable {
    var id: String
    var name: String
    var description: String
    var isAllergicMilk: Bool
    var isAllergicSoyBean: Bool
    var isAllergicWheat: Bool
    var imageName: String
}

#Preview {
    ContentView()
}
