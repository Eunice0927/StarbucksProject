//
//  BeverageAddView.swift
//  StarbucksProject
//
//  Created by Eunsu JEONG on 11/2/23.
//

import SwiftUI

struct BeverageAddView: View {
    @StateObject var beverageStore: BeverageStore
    @Binding var path: NavigationPath
    
    @State private var isAllergicMilk = false
    @State private var isAllergicSoyBean = false
    @State private var isAllergicWheat = false
    @State private var name: String = ""
    @State private var description: String = ""
    
    var body: some View {
        Form {
            Section {
                Image(systemName: "takeoutbag.and.cup.and.straw")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
                
                DataInput(title: "메뉴", userInput: $name)
                
                DataInput(title: "설명", userInput: $description)
            } header: { Text("음료 설명") }
            
            Section {
                Toggle(isOn: $isAllergicMilk) {
                    Text("우유")
                }
                Toggle(isOn: $isAllergicWheat) {
                    Text("밀")
                }
                Toggle(isOn: $isAllergicSoyBean) {
                    Text("대두")
                }
                
            } header: { Text("알레르기 유발요인") }
        }
        Button {
            addNewBeverage()
        } label: { Text("새 음료 추가") }
    }

    func addNewBeverage() {
        let newBeverage = Beverage(
            id: UUID().uuidString,
            name: name,
            description: description,
            isAllergicMilk: isAllergicMilk,
            isAllergicSoyBean: isAllergicSoyBean,
            isAllergicWheat: isAllergicWheat,
            imageName: "IceAmericano")
        
        beverageStore.beverages.append(newBeverage)
        path.removeLast()
    }
}

struct DataInput: View {
    var title: String
    @Binding var userInput: String
    
    var body: some View {
        VStack {
            Text(title)
                .font(.headline)
            
            TextField("Enter \(title)", text: $userInput)
                .textFieldStyle(.roundedBorder)
        }
    }
}


//#Preview {
//    BeverageAddView(beverageStore: BeverageStore(beverages: beverageData))
//}
