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
    
    var viewModel = UserRegisterViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func updateButtonTapped(_ sender: Any) {
        if let kisi = userName.text, let kt = userPhone.text {
            viewModel.registerUser(user_name: kisi, user_tel: kt)
        }
    }
    
}
