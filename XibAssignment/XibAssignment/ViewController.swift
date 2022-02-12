//
//  ViewController.swift
//  XibAssignment
//
//  Created by Jiaying Xie on 2/11/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let images = ["apple", "banana", "cherry", "coconut", "grape", "kiwi", "lemon", "mandarin", "orange", "strawberry"]

    let imageNames = ["apple", "banana", "cherry", "coconut", "grape", "kiwi", "lemon", "mandarin", "orange", "strawberry"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("TableViewCell", owner: self, options: nil)?.first as! TableViewCell
        
        cell.imgView.image = UIImage(named: images[indexPath.row])
        cell.lblImage.text = imageNames[indexPath.row]
        
        return cell
    }
}

