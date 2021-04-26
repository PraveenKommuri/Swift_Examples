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
        
        networkManager.getApiData(requestUrl: currenciesApiUrl!, resultType: CurrencyDataResponse.self) { (currencyAPIResponse, httpResponse, error) in
            completion(currencyAPIResponse, httpResponse, error)
        }
        
    }
    
}
