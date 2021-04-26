//
//  NetworkManager.swift
//  Currencies_MVVM
//
//  Created by Praveen Kommuri on 4/21/21.
//

import Foundation

struct NetworkManager {
    
    func getApiData<T:Decodable>(requestUrl: URL, resultType: T.Type, completionHandler:@escaping(_ result: T?, URLResponse?, Error?)-> Void) {
        
        URLSession.shared.dataTask(with: requestUrl) { (responseData, httpUrlResponse, error) in
            
            if (responseData != nil) {
                let decoder = JSONDecoder()
                do {
                    let result = try decoder.decode(T.self, from: responseData!)
                    completionHandler(result, httpUrlResponse, error)
                    return
                } catch let error {
                    print("Error occurred while decoding: \(error)")  //TODO - we can test this case by pass wrong model object.  Can add completion handler too.
                }
            }
            completionHandler(responseData as? T, httpUrlResponse, error)  //all other cases.
            
        }.resume()
    }
    
    
}
