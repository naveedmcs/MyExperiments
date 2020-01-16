//
//  JsonParserGanaricFunctions.swift
//  AalmofireJsonExample
//
//  Created by apple on 12/16/19.
//  Copyright © 2019 mytechnology. All rights reserved.
//

import Foundation
import Alamofire


enum BackendError: Error {
  case urlError(reason: String)
  case objectSerialization(reason: String)
  case parsing(reason: String)
  case responseErrorMessage(reason:String)
}



typealias ResponseHandler<T: Decodable> =  (Result<T>) -> Void


extension Data {
    var prettyPrintedJSONString: NSString? { /// NSString gives us a nice sanitized debugDescription
            guard let object = try? JSONSerialization.jsonObject(with: self, options: []),
    let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]),
    let prettyPrintedString = NSString(data: data, encoding: String.Encoding.utf8.rawValue) else { return nil }
    return prettyPrintedString
    }
}

extension JSONDecoder {
    func decodeResponse<T: Decodable>(from response: DefaultDataResponse) -> Result<T> {
    guard response.error == nil else {
      print(response.error!)
      return .failure(response.error!)
    }

    if let json = response.data?.prettyPrintedJSONString {
       print("JSON")
       print(json)
    }
        
        
    guard let responseData = response.data else {
      print("didn't get any data from API")
        let error = BackendError.parsing(reason:"Did not get data in response")
      return .failure(error)
    }

    do {
      let item = try decode(T.self, from: responseData)
      return .success(item)
    } catch {
      print("error trying to decode response")
      print(error)
      return .failure(error)
    }
  }
}
