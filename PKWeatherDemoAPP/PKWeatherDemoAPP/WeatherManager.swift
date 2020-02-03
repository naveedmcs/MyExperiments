//
//  WeatherManager.swift
//  PKWeatherDemoAPP
//
//  Created by apple on 2/3/20.
//  Copyright © 2020 mytechnology. All rights reserved.
//

import Foundation

struct WeatherManager
{
    
    private let httpUtility: HttpHandler
    
    init(_httpUtility: HttpHandler) {
        httpUtility = _httpUtility
    }
    
    func getWeatherDetailBy(lat:String, long: String)
    {
        let requestURL = "https://api.openweathermap.org/data/2.5/weather?lat=\(lat)&lon=\(long)&appid=\(AppConstant.weather.apiKey.rawValue)"
        
        httpUtility.getApiData(requestUrl:requestURL, resultType: WeatherResponse.self) { (weatherResult, error)  in
            
            guard let weatherDetail = weatherResult else {
                print(error ?? "something went wrong")
                return
            }
            
            debugPrint(weatherDetail)
        }
        
    }
}

//let objEmployee = Employee(_httpUtility: HttpHandler())

