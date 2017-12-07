//
//  NetworkUtility.swift
//  LocationOverviewDemo
//
//  Created by Shawn Roller on 11/21/17.
//  Copyright © 2017 Shawn Roller. All rights reserved.
//

import Foundation

// NetworkUtility simply formats and executes the passed-in request, and responds back with the raw data to the requestor

struct NetworkUtility {
    
    static public func makeRequest(urlString: String, params: [AnyHashable: Any], completion: @escaping (_ response: [AnyHashable: Any]?) -> Void) {
        
        guard let url = URL(string: urlString) else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) { (data, urlResponse, error) in
            
            if error == nil, let data = data {
                do {
                    let jsonObject = try JSONSerialization.jsonObject(with: data, options: []) as? [AnyHashable: Any]
                    completion(jsonObject)
                }
                catch {
                    print(error.localizedDescription)
                }
            }
            else {
                print(error?.localizedDescription as Any)
            }
            
        }
        
        task.resume()
        
    }
    
}
