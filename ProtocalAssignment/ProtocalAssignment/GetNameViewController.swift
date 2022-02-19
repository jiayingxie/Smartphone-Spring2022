//
//  GetNameViewController.swift
//  ProtocalAssignment
//
//  Created by Jiaying Xie on 2/18/22.
//

import UIKit

protocol SendFirstAndLastNameDelegate {
    func setFirstAndLastName(firstName: String, lastName: String)
    func setWelcomeText(welcomtText: String)
}

class GetNameViewController: UIViewController {
    var firstName : String?
    var lastName : String?
    
    var sendFirstAndLastNameDelegate : SendFirstAndLastNameDelegate?
    
    @IBOutlet weak var txtFirstName: UITextField!
    @IBOutlet weak var txtLastName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        guard let firstName = firstName else{return}
        guard let lastName = lastName else{return}
        
        txtFirstName.text = firstName
        txtLastName.text = lastName
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        txtFirstName.text?.removeAll()
//        txtLastName.text?.removeAll()
//    }
    
    @IBAction func saveName(_ sender: Any) {
        guard let firstName = txtFirstName.text else{return}
        guard let lastName = txtLastName.text else{return}
        

        sendFirstAndLastNameDelegate?.setFirstAndLastName(firstName: firstName, lastName: lastName)
        sendFirstAndLastNameDelegate?.setWelcomeText(welcomtText: "Welcome, \(firstName), \(lastName)!")
        
        self.navigationController?.popViewController(animated: true)
    }
    
}
