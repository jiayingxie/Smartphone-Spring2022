//
//  SecondViewController.swift
//  segueAssignment
//
//  Created by Jiaying Xie on 2/11/22.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var lblWelcome: UILabel!
    var welcomeStr = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lblWelcome.text = welcomeStr
    }
    
    
    @IBAction func goBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    

}
