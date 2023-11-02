//
//  ContentView.swift
//  StarbucksProject
//
//  Created by Eunsu JEONG on 11/2/23.
//

import SwiftUI

struct ContentView: View {
   @StateObject var beverageStore = BeverageStore(beverages: beverageData)

    var body: some View {
        List {
            ForEach (0..<beverageStore.beverages.count, id: \.self) { i in
                ListCell(beverage: beverageStore.beverages[i])
            }
        }
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// JSON 파일을 로드하는 표준 방식, 이후 앱에서도 사용이 가능
func loadJson<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("\(filename) not found.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Could not load \(filename): \(error)")
    }

    do {
        return try JSONDecoder().decode(T.self, from: data)
    } catch {
        fatalError("Unable to parse \(filename): \(error)")
    }

}

var beverageData: [Beverage] = loadJson("starbucksData.json")

class BeverageStore : ObservableObject {

    @Published var beverages: [Beverage]

    init(beverages: [Beverage] = []) {
        self.beverages = beverages
    }
}

// 사용자 인테페이스 콘텐트 뷰 설계


// 하위 뷰로 추출
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
//    ContentView()
//}
