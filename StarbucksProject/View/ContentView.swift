//
//  ContentView.swift
//  StarbucksProject
//
//  Created by Eunsu JEONG on 11/2/23.
//

import SwiftUI

// 사용자 인테페이스 콘텐트 뷰 설계
struct ContentView: View {
    @StateObject var beverageStore = BeverageStore(beverages: beverageData)
    @State private var stackPath = NavigationPath() //네비게이션 경로 추가
    var body: some View {
        NavigationStack(path: $stackPath) {
            List {
                ForEach (0..<beverageStore.beverages.count, id: \.self) { index in
                    NavigationLink(value: index) {
                        ListCell(beverage: beverageStore.beverages[index])
                    }
                }
            }
            .navigationDestination(for: Int.self) { index in
                BeverageDetailView(selectedBeverage: beverageStore.beverages[index])
            }
            .navigationDestination(for: String.self, destination: { i in
                BeverageAddView(beverageStore: self.beverageStore, path: $stackPath)
            })
            .navigationTitle("스타벅스")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    EditButton()
                }
                ToolbarItem(placement: .topBarLeading) {
                    NavigationLink(value: "새 음료 추가") {
                        Text("Add")
                    }
                }
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


//#Preview {
//    ContentView()
//}