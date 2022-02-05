//
//  ViewController.swift
//  CustomTableViewCell
//
//  Created by Jiaying Xie on 2/3/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let images = ["Seattle1", "Seattle2", "Seattle3", "Seattle4", "Seattle5", "Seattle6", "Seattle7", "Seattle8", "Seattle9", "Seattle10"]

    let imageNames = ["img1", "img2", "img3", "img4", "img5", "img6", "img7", "img8", "img9", "img10"]
    
    @IBOutlet weak var tblView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tblView.delegate = self
        tblView.dataSource = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as!TableViewCell
        
//        cell.textLabel?.text = arr[indexPath.row]
        cell.lblCell.text = imageNames[indexPath.row]
        
        cell.imgViewCell.image = UIImage(named: images[indexPath.row])
//        ??? textLabel
        
        return cell
    }
}

