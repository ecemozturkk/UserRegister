//
//  HomeViewModel.swift
//  UserRegister
//
//  Created by Ecem Öztürk on 10.08.2023.
//

import Foundation
import RxSwift

class HomeViewModel {
    var krepo = UsersDaoRepository()
    
    var kisilerListesi = BehaviorSubject<[Kisiler]>(value: [Kisiler]()) // tetikleme ve dinleme yapısı
    
    init(){
        veritabaniKopyala ()
        kisilerListesi = krepo.kisilerListesi
    }
    
    func sil (kisi_id: Int) {
        krepo.sil(kisi_id: kisi_id)
        kisileriYukle()
    }
    func ara(aramaKelimesi: String) {
        krepo.ara(aramaKelimesi: aramaKelimesi)
    }
    func kisileriYukle () {
        krepo.kisileriYukle()
    }
    
    func veritabaniKopyala () {
        let bundleYolu = Bundle.main.path(forResource: "rehber", ofType: ".sqlite")
        
        let dosyaYolu = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let veritabaniURL = URL(fileURLWithPath: dosyaYolu).appendingPathComponent("rehber.sqlite")
        
        let fm = FileManager.default
        
        if fm.fileExists(atPath: veritabaniURL.path()) {
            print("Veritabanı mevcut")
        } else {
            do {
                try fm.copyItem(atPath: bundleYolu!, toPath: veritabaniURL.path)
            } catch {
                print(error.localizedDescription)
            }
        }
        
    }
}
