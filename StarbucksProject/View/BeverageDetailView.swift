//
//  BeverageDetailView.swift
//  StarbucksProject
//
//  Created by KHJ on 2023/11/02.
//

import SwiftUI

struct BeverageDetailView: View {
    let selectedBeverage: Beverage
    let similarBeverages: [Beverage]
    
    var otherBeverages: [Beverage] {
        return similarBeverages.filter { $0.name != selectedBeverage.name }
    }
    var body: some View {
        VStack {
            Image(selectedBeverage.imageName)
                .resizable()
                .ignoresSafeArea()
                .frame(minHeight: 330)
            VStack(alignment: .leading, spacing: 20) {
                Text(selectedBeverage.name)
                    .font(.system(size: 30))
                    .fontWeight(.heavy)
                    .padding(.horizontal)
                Text(selectedBeverage.description)
                    .font(.body)
                    .foregroundStyle(.gray)
                    .padding(.horizontal)
            }
        }
        
        List {
            if selectedBeverage.isAllergicMilk == false && selectedBeverage.isAllergicWheat == false && selectedBeverage.isAllergicSoyBean == false {
                
            } else {
                
                Section("알레르기 유발요인") {
                    if selectedBeverage.isAllergicMilk {
                        Text("🥛 우유")
                    }
                    if selectedBeverage.isAllergicSoyBean {
                        Text("🫘 대두")
                    }
                    if selectedBeverage.isAllergicWheat {
                        Text("🌾 밀")
                    }
                }
            }
            
            Section("비슷한 다른 메뉴") {
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(alignment: .top, spacing: 10) {
                        ForEach(otherBeverages) { beverage in
                            VStack(alignment: .center) {
                                Image(beverage.imageName)
                                    .resizable()
                                    .clipShape(.circle)
                                    .aspectRatio(contentMode: .fit)
                                    .frame(height: 70)
                                
                                Text(beverage.name)
                                    .font(.footnote)
                                    .frame(width: 70, alignment: .top)
                                    .multilineTextAlignment(.center)
                                    .minimumScaleFactor(0.5)
                            }
                        }
                    }
                    .padding(.top)
                }
            }
        }
        .background(Color.clear)
    }
}

#Preview {
    NavigationStack {
        BeverageDetailView(selectedBeverage: beverageData[4], similarBeverages: beverageData)
    }
}
