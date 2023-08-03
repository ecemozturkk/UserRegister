//
//  UserDetailViewController.swift
//  31July
//
//  Created by Ecem Öztürk on 31.07.2023.
//

import UIKit

class UserDetailViewController: UIViewController {

    @IBOutlet weak var userNameLbl: UITextField!
    @IBOutlet weak var userPhoneLbl: UITextField!
    
    var kisi:Kisiler?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let k = kisi {
            userNameLbl.text = k.kisi_ad
            userPhoneLbl.text = k.kisi_tel
        }
    }
    

    @IBAction func updateButtonTapped(_ sender: Any) {
        if let ka = userNameLbl.text, let kt = userPhoneLbl.text, let k = kisi {
            guncelle(kisi_id: k.kisi_id!, kisi_ad: ka, kisi_tel: kt)
        }
    }
    
    func guncelle(kisi_id: Int, kisi_ad: String, kisi_tel:String){
        print("Kişi güncelle: \(kisi_ad) , ")
    }
    

}
//viewdidload => sayfa göründüğünde (bir kere çalışır),
//viewwillappear,=> sayfa göründüğünde(her seferde), sayfalara geri dönüldüğünü anlayabiliriz
//viewwilldisappear => sayfa görünmez olduğunda
