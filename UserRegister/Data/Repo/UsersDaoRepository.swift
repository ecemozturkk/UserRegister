//
//  UsersDaoRepository.swift
//  UserRegister
//
//  Created by Ecem Öztürk on 10.08.2023.
//

import Foundation
import RxSwift

class UsersDaoRepository {
    var kisilerListesi = BehaviorSubject<[Kisiler]>(value: [Kisiler]()) // tetikleme ve dinleme yapısı
    
    func registerUser (user_name: String, user_tel: String) {
        print("Kişi kaydet: \(user_name) - \(user_tel)")
    }
    func guncelle(kisi_id: Int, kisi_ad: String, kisi_tel:String){
        print("Kişi güncelle: \(kisi_ad) , ")
    }
    
    func sil(kisi_id: Int) {
        print("Kişi sil: \(kisi_id)")
    }
    func ara(aramaKelimesi: String) {
        print("Kişi ara: \(aramaKelimesi)")
    }
    func kisileriYukle () {
        
        var liste = [Kisiler]()
        
        let k1 = Kisiler(kisi_id: 1, kisi_ad: "aaa", kisi_tel: "1111")
        let k2 = Kisiler(kisi_id: 2, kisi_ad: "aasd", kisi_tel: "222")
        let k3 = Kisiler(kisi_id: 3, kisi_ad: "fdg", kisi_tel: "333")
        let k4 = Kisiler(kisi_id: 4, kisi_ad: "asf", kisi_tel: "4444")
        let k5 = Kisiler(kisi_id: 5, kisi_ad: "aasfg", kisi_tel: "")
        let k6 = Kisiler(kisi_id: 6, kisi_ad: "aghfgh", kisi_tel: "1111")
        liste.append(k1)
        liste.append(k2)
        liste.append(k3)
        liste.append(k4)
        liste.append(k5)
        liste.append(k6)
        
        kisilerListesi.onNext(liste) // Tetikleme
    }
    
}
