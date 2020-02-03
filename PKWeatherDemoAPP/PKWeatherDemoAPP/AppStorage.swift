//
//  AppStorage.swift
//  PKWeatherDemoAPP
//
//  Created by apple on 2/3/20.
//  Copyright © 2020 mytechnology. All rights reserved.
//

import Foundation

struct AppStorage {
    static var pakistanCities: [City] {
        get {
            if let worldCitiesList = loadJson(filename: "city") {
                var cities = worldCitiesList.filter({$0.country == "PK"})
                cities = cities.sorted(by: { $0.name?.lowercased() ?? "" < $1.name?.lowercased() ?? "" })
                print("total \(cities ) Cities found in Pakistan Region")
                return cities
            }
            else {
                print("Pakistan Cites not found in Json File")
                return []
            }
        }
    }
    
    private static func loadJson(filename fileName: String) -> [City]? {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode([City].self, from: data)
                return jsonData
            } catch {
                print("error:\(error)")
            }
        }
        return nil
    }
}
