//
//  UserRegisterViewModel.swift
//  UserRegister
//
//  Created by Ecem Öztürk on 10.08.2023.
//

import Foundation

class UserRegisterViewModel {
    
    var krepo = UsersDaoRepository()
    
    func registerUser (user_name: String, user_tel: String) {
        krepo.kisileriYukle(kisi_ad: user_name, kisi_tel: user_tel)
        
    }
    
}
