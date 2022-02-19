//
//  ViewController.swift
//  ProtocalAssignment
//
//  Created by Jiaying Xie on 2/18/22.
//

import UIKit

class ViewController: UIViewController, SendFirstAndLastNameDelegate {
    // implement SendFirstAndLastNameDelegate的两个函数
    func setFirstAndLastName(firstName: String, lastName: String) {
        lblLastName.text = lastName
        lblFirstName.text = firstName
    }
    
    func setWelcomeText(welcomtText: String) {
        lblWelcome.text = welcomtText
    }
    

    @IBOutlet weak var lblFirstName: UILabel!
    @IBOutlet weak var lblLastName: UILabel!
    @IBOutlet weak var lblWelcome: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueGetName" {
            let getNameVC = segue.destination as! GetNameViewController
            
            guard let firstName = lblFirstName.text else {return}
            guard let lastName = lblLastName.text else {return}
            
            // 为了GetNameViewController的两个textfield可以显示当前label的内容
            getNameVC.firstName = firstName
            getNameVC.lastName = lastName
            
            getNameVC.sendFirstAndLastNameDelegate = self
        }
    }
    

    @IBAction func getNameFromUser(_ sender: Any) {
        // 跳转页面就用performSegue
        performSegue(withIdentifier: "segueGetName", sender: self)
    }
    
    
}

