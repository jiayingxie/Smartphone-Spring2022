//
//  GetNameViewController.swift
//  ProtocolAnsDelegate
//
//  Created by Jiaying Xie on 2/13/22.
//

import UIKit

protocol SendFirstAndLastNameDelegate {
    func setFirstAndLastName(firstName: String, lastName: String)
    func setWelcomeText(welcomeText: String)
}

class GetNameViewController: UIViewController {
    var firstName : String?
    var lastName : String?
    
    var sendFirstAndLastNameDelegate : SendFirstAndLastNameDelegate?
    
    @IBOutlet weak var txtFirstName: UITextField!
    @IBOutlet weak var txtLastName: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let firstName = firstName else {return}
        guard let lastName = lastName else {return}
        
        txtFirstName.text = firstName
        txtLastName.text = lastName
    }
    
    @IBAction func saveName(_ sender: Any) {
        guard let first = txtFirstName.text else {return}
        guard let last = txtLastName.text else {return}
        
        sendFirstAndLastNameDelegate?.setFirstAndLastName(firstName: first, lastName: last)
        sendFirstAndLastNameDelegate?.setWelcomeText(welcomeText: "Welcome \(first), \(last)")
        self.navigationController?.popViewController(animated: true)
    }
    

}
