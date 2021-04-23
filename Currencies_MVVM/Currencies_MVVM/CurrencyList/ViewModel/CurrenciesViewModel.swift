//
//  CurrenciesViewModel.swift
//  Currencies_MVVM
//
//  Created by Praveen Kommuri on 4/21/21.
//

import Foundation

struct CurrenciesViewModel {
    
    func getCurrencies(completion: @escaping(_ response: CurrencyDataResponse?, URLResponse?, Error?) -> Void) {
        
        let currenciesService = CurrenciesService()
        
        currenciesService.getCurrenciesService(endPoint: APIEndPoints.currencies) { (currencyDataResponse, urlResponse, error) in
            completion(currencyDataResponse, urlResponse, error)
        }
        
        
//        currenciesService.getCurrenciesService(endPoint: "") { (currencyDataResponse, urlResponse, error) in
//            _ = completion(currencyDataResponse, urlResponse, error)
//        }

        
    }
    
}
