//
//  UserAPIManager.swift
//  AalmofireJsonExample
//
//  Created by apple on 12/16/19.
//  Copyright © 2019 mytechnology. All rights reserved.
//

import Foundation
import Alamofire



class BaseManager: NSObject {
 
 var sessionManager: SessionManager =  Alamofire.SessionManager.default
 var rawHeader: HTTPHeaders =  ["Content-Type": "application/json"]


 
}


class UserAPIManager: BaseManager {
    static let shared = UserAPIManager()
    
    
    func fetchUsers(result:@escaping ResponseHandler<[UserAPIResponse]>)  {
          
          let url = "https://jsonplaceholder.typicode.com/users"
          // make calls with the session manager
          let request = sessionManager.request(url,
                                               method: .get,
                                               parameters: nil,
                                               encoding: JSONEncoding.default,
                                               headers: self.rawHeader )
        
        
          
        request.response { (response ) in
         
           let decoder = JSONDecoder()
           let users: Result<[UserAPIResponse]> = decoder.decodeResponse(from: response)
            result(users)
       }
    }
    
}








