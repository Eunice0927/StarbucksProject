//
//  ListCell.swift
//  StarbucksProject
//
//  Created by KHJ on 2023/11/02.
//

import SwiftUI

struct ListCell: View {
    var beverage: Beverage
    
    var body: some View {
        HStack {
            Image(beverage.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 60)
            Text(beverage.name)
        }
    }
}

//#Preview {
//    ListCell()
//}
