//
//  WeatherManager.swift
//  PKWeatherDemoAPP
//
//  Created by apple on 2/3/20.
//  Copyright © 2020 mytechnology. All rights reserved.
//

import Foundation

class WeatherManager: APIBaseManager {
    
  
    func getWeatherDetailBy(lat:String, long: String,completion:@escaping((APIResponse<WeatherResponse, String>) -> Void)) {

        let url = "\(baseUrl)lat=\(lat)&lon=\(long)&appid=\(AppConstant.weather.apiKey.rawValue)"
        
        let request = sessionManager.request(url)
        
        request.response { (response) in
            let result = self.decodeResponse(response, resultType: WeatherResponse.self)
           
            completion(result)
        }
    }
    
}



