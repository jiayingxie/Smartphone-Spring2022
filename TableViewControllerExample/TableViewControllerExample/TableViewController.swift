//
//  TableViewController.swift
//  TableViewControllerExample
//
//  Created by Jiaying Xie on 1/30/22.
//

import UIKit

class TableViewController: UITableViewController {

    let arr = ["Aaa", "Bbb", "Ccc", "Ddd", "Eee", "Fff", "Ggg", "HH"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

 

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arr.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = arr[indexPath.row]
        
        return cell
    }
    

}
