//
//  CurrenciesTableViewController.swift
//  Currencies_MVVM
//
//  Created by Praveen Kommuri on 4/21/21.
//

import UIKit

class CurrenciesTableViewController: UITableViewController {
    
    let currenciesVM = CurrenciesViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        getAllCurrencies()
    }

    
    private func getAllCurrencies() {

        //currenciesVM.getCurrencies { (currenciesAPIData, urlResponse, error) in
        currenciesVM.getCurrencies { (result) in
            switch result {
            case .success(let result):
                print("response from result: \(result)")
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print("error localizaed: \(error.localizedDescription)")
                //Show some alert to user with info what we got.
            }
        }
    }
    
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currenciesVM.currenciesTableData?.data.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = currenciesVM.currenciesTableData?.data[indexPath.row].name
        cell.detailTextLabel?.text = currenciesVM.currenciesTableData?.data[indexPath.row].id
        return cell
    }

}
