//
//  UserDetailViewModel.swift
//  UserRegister
//
//  Created by Ecem Öztürk on 10.08.2023.
//

import Foundation

class UserDetailViewModel {
    
    var krepo = UsersDaoRepository()
    
    func guncelle(kisi_id: Int, kisi_ad: String, kisi_tel:String){
        krepo.guncelle(kisi_id: kisi_id, kisi_ad: kisi_ad, kisi_tel: kisi_tel)
        
    }
}
