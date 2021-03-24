//
//  SampleDataModel.swift
//  sample1
//
//  Created by Praveen on 3/23/21.
//  Copyright © 2021 Praveen. All rights reserved.
//

import Foundation

    struct user: Codable {
        let userId: Int
        let firstName: String
        let lastName: String
        let phoneNumber: String
        let emailAddress: String
    }

    struct sampleRecord: Codable {
        let users: [user]
    }
