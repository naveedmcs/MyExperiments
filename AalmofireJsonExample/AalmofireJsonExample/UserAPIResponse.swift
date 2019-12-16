//
//  UserAPIResponse.swift
//  AalmofireJsonExample
//
//  Created by apple on 12/16/19.
//  Copyright © 2019 mytechnology. All rights reserved.
//

import Foundation

struct UserAPIResponse : Codable {

    let address : Addres?
    let company : Company?
    let email : String?
    let id : Int?
    let name : String?
    let phone : String?
    let username : String?
    let website : String?


    enum CodingKeys: String, CodingKey {
        case address
        case company
        case email = "email"
        case id = "id"
        case name = "name"
        case phone = "phone"
        case username = "username"
        case website = "website"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        address = try Addres(from: decoder)
        company = try Company(from: decoder)
        email = try values.decodeIfPresent(String.self, forKey: .email)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        phone = try values.decodeIfPresent(String.self, forKey: .phone)
        username = try values.decodeIfPresent(String.self, forKey: .username)
        website = try values.decodeIfPresent(String.self, forKey: .website)
    }


}

struct Company : Codable {

    let bs : String?
    let catchPhrase : String?
    let name : String?


    enum CodingKeys: String, CodingKey {
        case bs = "bs"
        case catchPhrase = "catchPhrase"
        case name = "name"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        bs = try values.decodeIfPresent(String.self, forKey: .bs)
        catchPhrase = try values.decodeIfPresent(String.self, forKey: .catchPhrase)
        name = try values.decodeIfPresent(String.self, forKey: .name)
    }


}

struct Addres : Codable {

    let city : String?
    let geo : Geo?
    let street : String?
    let suite : String?
    let zipcode : String?


    enum CodingKeys: String, CodingKey {
        case city = "city"
        case geo
        case street = "street"
        case suite = "suite"
        case zipcode = "zipcode"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        city = try values.decodeIfPresent(String.self, forKey: .city)
        geo = try Geo(from: decoder)
        street = try values.decodeIfPresent(String.self, forKey: .street)
        suite = try values.decodeIfPresent(String.self, forKey: .suite)
        zipcode = try values.decodeIfPresent(String.self, forKey: .zipcode)
    }


}

struct Geo : Codable {

    let lat : String?
    let lng : String?


    enum CodingKeys: String, CodingKey {
        case lat = "lat"
        case lng = "lng"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        lat = try values.decodeIfPresent(String.self, forKey: .lat)
        lng = try values.decodeIfPresent(String.self, forKey: .lng)
    }


}
