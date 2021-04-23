//
//  CurrenciesService.swift
//  Currencies_MVVM
//
//  Created by Praveen Kommuri on 4/21/21.
//

import Foundation

struct CurrenciesService {
    
    func getCurrenciesService(endPoint: String, completion: @escaping(_ result: CurrencyDataResponse?, URLResponse?, Error?)-> Void) {
        
        let currenciesApiUrl = URL(string: endPoint)
        let networkManager = NetworkManager()
        
        do {
            networkManager.getApiData(requestUrl: currenciesApiUrl!, resultType: CurrencyDataResponse.self) { (currencyAPIResponse, httpResponse, error) in
                _ = completion(currencyAPIResponse, httpResponse, error)
            }
        } catch let error {
            print("Error object: \(error)")
        }
        
    }
    
}
