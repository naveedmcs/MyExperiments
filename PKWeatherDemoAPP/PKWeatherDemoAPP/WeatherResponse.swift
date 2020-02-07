//
//  WeatherResponse.swift
//  PKWeatherDemoAPP
//
//  Created by apple on 2/3/20.
//  Copyright © 2020 mytechnology. All rights reserved.
//

import Foundation



// MARK: - WeatherResponse
struct WeatherResponse: Codable {
    let base : String?
    let clouds : Clouds?
    let cod : Int?
    let coord : Coord?
    let dt : Int?
    let id : Int?
    var main : Main?
    var name : String?
    let sys : Sys?
    let timezone : Int?
    let visibility : Int?
    let weather : [Weather]?
    let wind : Wind?


    enum CodingKeys: String, CodingKey {
        case base = "base"
        case clouds
        case cod = "cod"
        case coord
        case dt = "dt"
        case id = "id"
        case main
        case name = "name"
        case sys
        case timezone = "timezone"
        case visibility = "visibility"
        case weather = "weather"
        case wind
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        base = try values.decodeIfPresent(String.self, forKey: .base)
        clouds = try values.decodeIfPresent(Clouds.self, forKey: .clouds)
        cod = try values.decodeIfPresent(Int.self, forKey: .cod)
        coord = try values.decodeIfPresent(Coord.self, forKey: .coord)
        dt = try values.decodeIfPresent(Int.self, forKey: .dt)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        main = try values.decodeIfPresent(Main.self, forKey: .main)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        sys = try values.decodeIfPresent(Sys.self, forKey: .sys)
        timezone = try values.decodeIfPresent(Int.self, forKey: .timezone)
        visibility = try values.decodeIfPresent(Int.self, forKey: .visibility)
        weather = try values.decodeIfPresent([Weather].self, forKey: .weather)
        wind = try values.decodeIfPresent(Wind.self, forKey: .wind)
    }
}

// MARK: - Clouds
struct Clouds: Codable {
    let all : Int?


    enum CodingKeys: String, CodingKey {
        case all = "all"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        all = try values.decodeIfPresent(Int.self, forKey: .all)
    }
    
}

// MARK: - Coord
struct Coord: Codable {
    let lon, lat: Double?
    
    enum CodingKeys: String, CodingKey {
        case lat = "lat"
        case lon = "lon"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        lat = try values.decodeIfPresent(Double.self, forKey: .lat)
        lon = try values.decodeIfPresent(Double.self, forKey: .lon)
    }
}

// MARK: - Main
struct Main: Codable {
    
    
    let feelsLike : Double?
    let humidity : Int?
    let pressure : Int?
    let temp : Double?
    let tempMax : Double?
    let tempMin : Double?

    
    
    enum TempratureType {
        case celcius
        case fahrenHeit
        case kelvin
       
    }

    enum CodingKeys: String, CodingKey {
        case feelsLike = "feels_like"
        case humidity = "humidity"
        case pressure = "pressure"
        case temp = "temp"
        case tempMax = "temp_max"
        case tempMin = "temp_min"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        feelsLike = try values.decodeIfPresent(Double.self, forKey: .feelsLike)
        humidity = try values.decodeIfPresent(Int.self, forKey: .humidity)
        pressure = try values.decodeIfPresent(Int.self, forKey: .pressure)
        temp = try values.decodeIfPresent(Double.self, forKey: .temp)
        tempMax = try values.decodeIfPresent(Double.self, forKey: .tempMax)
        tempMin = try values.decodeIfPresent(Double.self, forKey: .tempMin)
    }
    
    mutating func formattedTemprature(type: TempratureType) -> String {
        guard let tempInKelvan = temp else{
            return "not found"
        }
        
        switch type {
        case .celcius:
            return String( Int( (tempInKelvan - 273.15).rounded() ) ) + "°C"
        case .fahrenHeit:
            return String( Int( (tempInKelvan - 273.15 * 9/5 + 32).rounded() ) ) + "°F"
        default:
            return  String( Int( tempInKelvan.rounded() ) ) + "°K"
        }
    }
}

// MARK: - Sys
struct Sys: Codable {
    let country : String?
    let id : Int?
    let sunrise : Int?
    let sunset : Int?
    let type : Int?


    enum CodingKeys: String, CodingKey {
        case country = "country"
        case id = "id"
        case sunrise = "sunrise"
        case sunset = "sunset"
        case type = "type"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        country = try values.decodeIfPresent(String.self, forKey: .country)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        sunrise = try values.decodeIfPresent(Int.self, forKey: .sunrise)
        sunset = try values.decodeIfPresent(Int.self, forKey: .sunset)
        type = try values.decodeIfPresent(Int.self, forKey: .type)
    }
}

// MARK: - Weather
struct Weather: Codable {
    let descriptionField : String?
    let icon : String?
    let id : Int?
    let main : String?


    enum CodingKeys: String, CodingKey {
        case descriptionField = "description"
        case icon = "icon"
        case id = "id"
        case main = "main"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        descriptionField = try values.decodeIfPresent(String.self, forKey: .descriptionField)
        icon = try values.decodeIfPresent(String.self, forKey: .icon)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        main = try values.decodeIfPresent(String.self, forKey: .main)
    }
}

// MARK: - Wind
struct Wind: Codable {
    let deg : Int?
    let speed : Double?


    enum CodingKeys: String, CodingKey {
        case deg = "deg"
        case speed = "speed"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        deg = try values.decodeIfPresent(Int.self, forKey: .deg)
        speed = try values.decodeIfPresent(Double.self, forKey: .speed)
    }
}
