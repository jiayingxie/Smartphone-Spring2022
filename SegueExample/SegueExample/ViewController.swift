//
//  ViewController.swift
//  SegueExample
//
//  Created by Jiaying Xie on 2/6/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var txtFirstName: UITextField!
    
    @IBOutlet weak var txtLastName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func goToSecondVC(_ sender: Any) {
        performSegue(withIdentifier: "segueToSecondVC", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToSecondVC" {
            let secondVC = segue.destination as! SecondViewController
            
            // before the 2nd vc is performed, but string is ready
            secondVC.welcomeStr = "Welcome \(txtFirstName.text!), \(txtLastName.text!) "
        }
    }
}

