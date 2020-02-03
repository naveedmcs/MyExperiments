//
//  HttpHandler.swift
//  PKWeatherDemoAPP
//
//  Created by apple on 2/3/20.
//  Copyright © 2020 mytechnology. All rights reserved.
//

import Foundation


struct HttpHandler
{
    func getApiData<T:Decodable>(requestUrl: String, resultType: T.Type, completionHandler:@escaping(_ result: T?, _ errorMessage: String?)-> Void)
    {
        guard let url =  URL(string: requestUrl) else {
            let errorMessage = "something wrong with URL"
            completionHandler(nil, errorMessage )
            return
        }
        
        print("request URL: \(url)")
        
        URLSession.shared.dataTask(with: url) { (responseData, httpUrlResponse, error) in

            if(error == nil && responseData != nil && responseData?.count != 0)
            {
                //parse the responseData here
                let decoder = JSONDecoder()
                do {
                    let result = try decoder.decode(T.self, from: responseData!)
                    _=completionHandler(result, nil)
                }
                catch let error{
                    let errorMessage = "error occured while decoding = \(error.localizedDescription)"
                    debugPrint(errorMessage)
                    completionHandler(nil, errorMessage)
                }
            }

        }.resume()
    }
}
