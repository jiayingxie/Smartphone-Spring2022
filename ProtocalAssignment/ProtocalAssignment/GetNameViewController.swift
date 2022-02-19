//
//  GetNameViewController.swift
//  ProtocalAssignment
//
//  Created by Jiaying Xie on 2/18/22.
//

import UIKit

// 在全局定义了一个delegate
protocol SendFirstAndLastNameDelegate {
    func setFirstAndLastName(firstName: String, lastName: String)
    func setWelcomeText(welcomtText: String)
}

class GetNameViewController: UIViewController {
    // ？意味着firstName可能是string，也可能是空值
    var firstName : String?
    var lastName : String?
    
    // 相当于获取了SendFirstAndLastNameDelegate的实例
    var sendFirstAndLastNameDelegate : SendFirstAndLastNameDelegate?
    
    @IBOutlet weak var txtFirstName: UITextField!
    @IBOutlet weak var txtLastName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // 要保证firstName和lastName非空
        guard let firstName = firstName else{return}
        guard let lastName = lastName else{return}
        
        // 如果两个name都有值，赋给两个textfield
        txtFirstName.text = firstName
        txtLastName.text = lastName
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        txtFirstName.text?.removeAll()
//        txtLastName.text?.removeAll()
//    }
    
    @IBAction func saveName(_ sender: Any) {
        // 获取两个textfield的值
        guard let firstName = txtFirstName.text else{return}
        guard let lastName = txtLastName.text else{return}
        
        // 这里只是传了参数
        sendFirstAndLastNameDelegate?.setFirstAndLastName(firstName: firstName, lastName: lastName)
        sendFirstAndLastNameDelegate?.setWelcomeText(welcomtText: "Welcome, \(firstName), \(lastName)!")
        
        // 把当前的view controller pop掉，感觉这里是类似stack的概念
        self.navigationController?.popViewController(animated: true)
    }
    
}
