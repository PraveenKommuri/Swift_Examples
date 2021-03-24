//
//  JSONUtils.swift
//  localJSON_Example
//
//  Created by Praveen on 3/24/21.
//  Copyright © 2021 Praveen. All rights reserved.
//

import Foundation


// MARK: - Helper methods for reading & parsing the JSON file.

/// Method to read the local json file.
/// - Parameter name: file name
/// - Returns: return file contents in Data format.
func readLocalJSONFile(forName name: String) -> Data? {
    do {
        if let filePath = Bundle.main.path(forResource: name, ofType: "json") {
            let fileUrl = URL(fileURLWithPath: filePath)
            let data = try Data(contentsOf: fileUrl)
            return data
        }
    } catch {
        print("error: \(error)")
    }
    return nil
}


/// Parse the jsonData using the JSONDecoder with help of sampleRecord model
/// - Parameter jsonData: jsonData object
func parse(jsonData: Data) -> sampleRecord? {
    do {
        let decodedData = try JSONDecoder().decode(sampleRecord.self, from: jsonData)
        return decodedData
    } catch {
        print("error: \(error)")
    }
    return nil
}
