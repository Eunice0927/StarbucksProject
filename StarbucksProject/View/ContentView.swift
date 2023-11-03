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
                Image("StarbucksLogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 50)
                    .padding(.leading)
                    .padding(.bottom)
                Spacer()
                NavigationLink(value: "새 음료 추가") {
                    Image(systemName: "plus")
                        .foregroundStyle(.gray)
                }
                .font(.system(size: 25))
                .padding(.trailing)
                .padding(.bottom)
            }
            
            ZStack {
                List {
                    Section {
                        ForEach (0..<beverageStore.beverages.count, id: \.self) { index in
                            NavigationLink(value: index) {
                                ListCell(beverage: beverageStore.beverages[index])
                            }
                            .listRowSeparator(.hidden)
                        }
                        .onMove(perform: moveItems)
                        .onDelete(perform: deleteItems)
                    } header: {
                        Text("음료")
                            .font(.system(size: 20))
                    }
                }
                .scrollContentBackground(.hidden)
                .navigationDestination(for: Int.self) { index in
                    BeverageDetailView(selectedBeverage: beverageStore.beverages[index], similarBeverages: beverageStore.beverages)
                }
                .navigationDestination(for: String.self, destination: { i in
                    BeverageAddView(beverageStore: self.beverageStore, path: $stackPath)
                })
                
                VStack {
                    Spacer()
                    HStack {
                        Image("coffeeIcon")
                            .resizable()
                            .modifier(CoffeeIconDesign())
                        Image("coffeeIcon")
                            .resizable()
                            .modifier(CoffeeIconDesign())
                        Image("coffeeIcon")
                            .resizable()
                            .modifier(CoffeeIconDesign())
                        Image("coffeeIcon")
                            .resizable()
                            .modifier(CoffeeIconDesign())
                        Image("coffeeIcon")
                            .resizable()
                            .modifier(CoffeeIconDesign())
                    }
                }
            }
        }
        .tint(.gray)
    }
    
    func deleteItems(at offsets: IndexSet) {
        beverageStore.beverages.remove(atOffsets: offsets)
    }
    
    func moveItems(from source: IndexSet, to destination: Int) {
        beverageStore.beverages.move(fromOffsets: source, toOffset: destination)
    }
}

struct CoffeeIconDesign: ViewModifier {
    func body(content: Content) -> some View {
        content
            .aspectRatio(contentMode: .fit)
            .frame(width: 35)
            .padding(.top)
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
