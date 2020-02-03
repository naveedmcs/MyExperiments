//
//  CityJsonResponse.swift
//  PKWeatherDemoAPP
//
//  Created by apple on 2/3/20.
//  Copyright © 2020 mytechnology. All rights reserved.
//

import Foundation

struct City: Decodable {
    let id: Int?
    let name, country: String?
    let coord: Coord?
    

    // MARK: - Coord
    struct Coord: Decodable {
        let lon, lat: Double?
    }
}
