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
        VStack {
                Image(selectedBeverage.imageName)
                    .resizable()
                    .ignoresSafeArea()
                    .frame(minHeight: 330)
//                    .clipShape(RoundedRectangle(cornerRadius: 12))
//                    .scaledToFit()
//                    .padding()
            HStack {
                Text(selectedBeverage.name)
                    .font(.system(size: 35))
                    .fontWeight(.heavy)
                    .padding()
                Spacer()
            }
            
            Text(selectedBeverage.description)
                .font(.body)
                .foregroundStyle(.gray)
            
            List {
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
        }
    }
}

#Preview {
    NavigationStack {
        BeverageDetailView(selectedBeverage: beverageData[0])
    }
}
