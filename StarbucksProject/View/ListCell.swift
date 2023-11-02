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
        HStack(spacing: 20) {
            Image(beverage.imageName)
                .resizable()
                .clipShape(.circle)
                .aspectRatio(contentMode: .fit)
                .frame(width: 70)
            Text(beverage.name)
        }
        .frame(alignment: .leading)
    }
}

//#Preview {
//    ListCell()
//}
