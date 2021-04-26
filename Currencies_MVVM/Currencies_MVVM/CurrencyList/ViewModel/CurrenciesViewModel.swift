//
//  CurrenciesViewModel.swift
//  Currencies_MVVM
//
//  Created by Praveen Kommuri on 4/21/21.
//

import Foundation

class CurrenciesViewModel {
    
    public var currenciesTableData : CurrencyDataResponse?
    
    //func getCurrencies(completion: @escaping(_ response: CurrencyDataResponse?, URLResponse?, Error?) -> Void) {
    func getCurrencies(completion: @escaping(Result<CurrencyDataResponse, Error>) -> Void) {
        
        let currenciesService = CurrenciesService()
                
        currenciesService.getCurrenciesService(endPoint: APIEndPoints.currencies) { (currencyDataResponse, urlResponse, error) in
            
            if let error = error {
                completion(.failure(error))
                return
            }
            
            if let httpUrlResponse = urlResponse as? HTTPURLResponse, let currencyDataResponse = currencyDataResponse {
                
                //success case.
                if httpUrlResponse.statusCode == 200 {
                    self.currenciesTableData = currencyDataResponse
                    completion(.success(currencyDataResponse))
                    return
                } else {
                    let error = NSError(domain: "AppName", code: 0, userInfo: [NSLocalizedDescriptionKey: "Something went wrong. Please try again."])
                    completion(.failure(error))
                    return
                }
            }
                        
        }
        
    }
    
}
