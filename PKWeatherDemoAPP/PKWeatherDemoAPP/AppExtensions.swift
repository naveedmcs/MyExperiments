//
//  AppExtensions.swift
//  PKWeatherDemoAPP
//
//  Created by apple on 2/7/20.
//  Copyright © 2020 mytechnology. All rights reserved.
//

import Foundation

extension Data {
    
    func decodeData<T:Decodable>(_ resultType: T.Type)-> APIResponse<T, String> {
        
        let decoder = JSONDecoder()
        do {
            let result = try decoder.decode(T.self, from: self)
            return .success(result: result)
        }
        catch let error{
            let errorMessage = "error occured while decoding = \(error.localizedDescription)"
            debugPrint(errorMessage)
            return .failure(errorMessage: errorMessage)
        }
        
    }
    
    var prettyPrintedJSONString: NSString? { /// NSString gives us a nice sanitized debugDescription
        guard let object = try? JSONSerialization.jsonObject(with: self, options: []),
            let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]),
            let prettyPrintedString = NSString(data: data, encoding: String.Encoding.utf8.rawValue) else { return nil }
        
        return prettyPrintedString
    }
}
