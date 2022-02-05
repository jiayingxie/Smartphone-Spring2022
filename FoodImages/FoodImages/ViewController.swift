//
//  ViewController.swift
//  FoodImages
//
//  Created by Jiaying Xie on 2/4/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let images = ["apple", "banana", "cherry", "coconut", "grape", "kiwi", "lemon", "mandarin", "orange", "strawberry"]

    let imageNames = ["apple", "banana", "cherry", "coconut", "grape", "kiwi", "lemon", "mandarin", "orange", "strawberry"]
    

    @IBOutlet weak var tblView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tblView.delegate = self
        tblView.dataSource = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as!TableViewCell
        cell.lblCell.text = imageNames[indexPath.row]
        cell.imgViewCell.image = UIImage(named: images[indexPath.row])
        return cell
    }

}

