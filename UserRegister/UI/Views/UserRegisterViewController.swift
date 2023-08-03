//
//  UserRegisterViewController.swift
//  31July
//
//  Created by Ecem Öztürk on 31.07.2023.
//

import UIKit

class UserRegisterViewController: UIViewController {

    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var userPhone: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func updateButtonTapped(_ sender: Any) {
        if let kisi = userName.text, let kt = userPhone.text {
            registerUser(user_name: kisi, user_tel: kt)
        }
    }
    
    
    func registerUser (user_name: String, user_tel: String) {
        print("Kişi kaydet: \(user_name) - \(user_tel)")
    }
}
