//
//  ViewController.swift
//  localJSON_Example
//
//  Created by Praveen on 3/23/21.
//  Copyright © 2021 Praveen. All rights reserved.
//

import UIKit


/// customTableViewCell to display users details.
class customTableViewCell: UITableViewCell {
    @IBOutlet var firstNameLabel: UILabel!
    @IBOutlet var lastNameLabel: UILabel!
    @IBOutlet var phoneNumberLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
}


class ViewController: UITableViewController {

    var sampleRecordsList: sampleRecord?

    override func viewDidLoad() {
        super.viewDidLoad()

        let jsonData = readLocalJSONFile(forName: "SampleRecords")

        if let data = jsonData {
            if let sampleRecordObj = parse(jsonData: data) {
                sampleRecordsList = sampleRecordObj
                tableView.reloadData()
            }
        }
    }
}


// MARK: - TableView Delegate methods.

extension ViewController {

    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
}


// MARK: - Tableview Datasource methods.

extension ViewController {

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sampleRecordsList?.users.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customTableViewCell") as? customTableViewCell
        cell?.firstNameLabel.text = "First Name: " + (sampleRecordsList?.users[indexPath.row].firstName ?? "")
        cell?.lastNameLabel.text = "Last Name: " + (sampleRecordsList?.users[indexPath.row].lastName ?? "")
        cell?.phoneNumberLabel.text = "Phone: " + (sampleRecordsList?.users[indexPath.row].phoneNumber ?? "")
        cell?.emailLabel.text = "Email: " + (sampleRecordsList?.users[indexPath.row].emailAddress ?? "")
        return cell!
    }

}

