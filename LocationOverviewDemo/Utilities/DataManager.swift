//
//  DataManager.swift
//  LocationOverviewDemo
//
//  Created by Shawn Roller on 11/21/17.
//  Copyright © 2017 Shawn Roller. All rights reserved.
//

import Foundation

// DataManager will pass in requests and receive responses from NetworkUtility and format the response into the appropriate model, which it will pass back to the original requestor

struct DataManager {
    
    static public func sendPostmanTestRequest(completion: @escaping (_ locations: [Location]) -> Void) {
        
        let urlString = API.mockURL
        let params = [AnyHashable: Any]()
        NetworkUtility.makeRequest(urlString: urlString, params: params) { (results) in
            
            guard let results = results, let response = results["response"] as? [AnyHashable: Any], let locations = response["locations"] as? [[AnyHashable: Any]] else { completion([]); return }
            
            let decoder = JSONDecoder()
            var newLocations = [Location]()
            
            for location in locations {
                
                do {
                    let data = try JSONSerialization.data(withJSONObject: location, options: .prettyPrinted)
                    let newLocation = try decoder.decode(Location.self, from: data)
                    newLocations.append(newLocation)
                } catch {
                    fatalError("Could not parse locations")
                }
                
            }
            
            completion(newLocations)
            
        }
        
    }
    
}
