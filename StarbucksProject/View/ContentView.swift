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
            HStack {
                Text("스타벅스")
                    .font(.system(size: 35))
                    .fontWeight(.heavy)
                    .padding(.leading)
                Spacer()
                NavigationLink(value: "새 음료 추가") {
                    Image(systemName: "plus")
                        .foregroundStyle(.gray)
                }
                .font(.system(size: 25))
                .padding(.trailing)
            }
            
            List {
                Section {
                    ForEach (0..<beverageStore.beverages.count, id: \.self) { index in
                        NavigationLink(value: index) {
                            ListCell(beverage: beverageStore.beverages[index])
                        }
                    }
                    .onMove(perform: moveItems)
                    .onDelete(perform: deleteItems)
                } header: {
                    Text("메뉴")
                        .font(.system(size: 20))
                }
            }
            .navigationDestination(for: Int.self) { index in
                BeverageDetailView(selectedBeverage: beverageStore.beverages[index])
            }
            .navigationDestination(for: String.self, destination: { i in
                BeverageAddView(beverageStore: self.beverageStore, path: $stackPath)
            })
//            .navigationTitle("스타벅스")
//            .toolbar {
//                ToolbarItem(placement: .topBarTrailing) {
//                    EditButton()
//                }
//                ToolbarItem(placement: .topBarLeading) {
//                    NavigationLink(value: "새 음료 추가") {
//                        Image(systemName: "plus")
//                            .foregroundStyle(.black)
//                    }
//                }
//            }
        }
    }
    
    func deleteItems(at offsets: IndexSet) {
        beverageStore.beverages.remove(atOffsets: offsets)
    }
    
    func moveItems(from source: IndexSet, to destination: Int) {
        beverageStore.beverages.move(fromOffsets: source, toOffset: destination)
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
