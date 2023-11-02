//
//  BeverageDetailView.swift
//  StarbucksProject
//
//  Created by KHJ on 2023/11/02.
//

import SwiftUI

struct BeverageDetailView: View {
    let selectedBeverage: Beverage
    var body: some View {
        Form {
            Section("Beverage Details") {
                Image(selectedBeverage.imageName)
                    .resizable()
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .scaledToFit()
                    .padding()
                Text(selectedBeverage.name)
                    .font(.headline)
                Text(selectedBeverage.description)
                    .font(.body)
            }
            if selectedBeverage.isAllergicMilk == false && selectedBeverage.isAllergicWheat == false && selectedBeverage.isAllergicSoyBean == false {
                
            } else {
                Section("알레르기 유발요인") {
                    if selectedBeverage.isAllergicMilk {
                        Text("우유 🥛")
                    }
                    if selectedBeverage.isAllergicSoyBean {
                        Text("대두 🫘")
                    }
                    if selectedBeverage.isAllergicWheat {
                        Text("밀 🌾")
                    }
                }
            }
        }
        .navigationTitle(selectedBeverage.name)
    }
}

#Preview {
    NavigationStack {
        BeverageDetailView(selectedBeverage: beverageData[1])
    }
}
