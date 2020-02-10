//
//  APIBaseMananger.swift
//  PKWeatherDemoAPP
//
//  Created by apple on 2/7/20.
//  Copyright © 2020 mytechnology. All rights reserved.
//

import Foundation
import Alamofire


enum APIResponse<T,String>{
    case failure(errorMessage: String)
    case success(result: T)
}

class APIBaseManager {
    
    var baseUrl: String {
        return "https://api.openweathermap.org/data/2.5/weather?"
    }
    
    var sessionManager: SessionManager {
        return SessionManager.default
    }


    func decodeResponse<T:Decodable>(_ response: DefaultDataResponse?, resultType: T.Type) -> APIResponse<T, String> {
       
        debugRequest(response: response)
      
        guard let data = response?.data else {
            return .failure(errorMessage: "Response Data is not found")
        }
        
       return data.decodeData(resultType)
      
    }
    
    private func debugRequest(response: DefaultDataResponse?)  {
        #if DEBUG
        print("URL Request:\(String(describing: response?.request))")
        print("Fetch ProductDetail Error: \(String(describing: response?.error))")
        if let json = response?.data?.prettyPrintedJSONString  {
            print("Json Response: \(json)")
        }
        #endif
    }
    
    

}
