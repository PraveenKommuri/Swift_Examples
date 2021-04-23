//
//  CurrencyModel.swift
//  Currencies_MVVM
//
//  Created by Praveen Kommuri on 4/21/21.
//

import Foundation



struct CurrencyDataResponse: Codable {
    var data: [Currency]
}

struct Currency: Codable {
    var id: String?
    var name: String?
    var min_size: String
}

