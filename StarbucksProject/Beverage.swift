//
//  Beverage.swift
//  StarbucksProject
//
//  Created by KHJ on 2023/11/02.
//

import Foundation

struct Beverage: Codable, Identifiable {
    var id: String
    var name: String
    var description: String
    var isAllergicMilk: Bool
    var isAllergicSoyBean: Bool
    var isAllergicWheat: Bool
    var imageName: String
    var imans: String
}

var beverageData: [Beverage] = loadJson("starbucksData.json")

class BeverageStore : ObservableObject {
    @Published var beverages: [Beverage]
    
    init(beverages: [Beverage] = []) {
        self.beverages = beverages
    }
}

// JSON 파일을 로드하는 표준 방식, 이후 앱에서도 사용이 가능
func loadJson<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
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
