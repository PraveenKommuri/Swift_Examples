//
//  CurrenciesTableViewController.swift
//  Currencies_MVVM
//
//  Created by Praveen Kommuri on 4/21/21.
//

import UIKit

class CurrenciesTableViewController: UITableViewController {
    
    let currenciesVM = CurrenciesViewModel()
    var currenciesTableData : CurrencyDataResponse? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        getAllCurrencies()
        
    }

    
    private func getAllCurrencies() {
        
        currenciesVM.getCurrencies { (currenciesAPIData, urlResponse, error) in
            
            //TODO - check for any errors.
            
            print("test")
            print("currenciesAPIData : \(String(describing: currenciesAPIData))")
            print("error: \(error?.localizedDescription ?? "")")
            
            
            if let httpUrlResponse = urlResponse as? HTTPURLResponse {
                print("urlResponse statuscode: \(httpUrlResponse.statusCode)")
            }
            
            
            
            if currenciesAPIData != nil {
                self.currenciesTableData = currenciesAPIData
                
                
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currenciesTableData?.data.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = currenciesTableData?.data[indexPath.row].name
        cell.detailTextLabel?.text = currenciesTableData?.data[indexPath.row].id
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
