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
    
    let db:FMDatabase?
    
    init() {
        let dosyaYolu = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let veritabaniURL = URL(fileURLWithPath: dosyaYolu).appendingPathComponent("rehber.sqlite")
        db = FMDatabase(path: veritabaniURL.path)
    }
    
    func kisileriYukle (kisi_ad: String, kisi_tel: String) {
        db?.open()
        do {
            try db?.executeUpdate("INSERT INTO kisiler (kisi_ad,kisi_tel) VALUES (?,?)", values: [kisi_ad,kisi_tel])
        } catch {
            print(error.localizedDescription)
        }
        db?.close()
        
    }
    func guncelle(kisi_id: Int, kisi_ad: String, kisi_tel:String){
        db?.open()
        do {
            try db?.executeUpdate("UPDATE kisiler SET kisi_tel = ?, kisi_ad = ? WHERE kisi_id = ?", values: [kisi_tel,kisi_ad,kisi_id])
        } catch {
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    func sil(kisi_id: Int) {
        db?.open()
        do {
            try db?.executeUpdate("DELETE FROM kisiler WHERE kisi_id = ?", values: [kisi_id])
        } catch {
            print(error.localizedDescription)
        }
        db?.close()
        
    }
    func ara(aramaKelimesi: String) {
        db?.open()
        var liste = [Kisiler]()
        
        do {
            let result = try db!.executeQuery("SELECT * FROM kisiler WHERE kisi_ad like '%\(aramaKelimesi)%'", values: nil)
            while result.next() {
                let kisi_id = Int(result.string(forColumn: "kisi_id"))!
                let kisi_ad = result.string(forColumn: "kisi_ad")!
                let kisi_tel = result.string(forColumn: "kisi_tel")!
                
                let kisi = Kisiler(kisi_id: kisi_id, kisi_ad: kisi_ad, kisi_tel: kisi_tel)
                liste.append(kisi)
            }
            kisilerListesi.onNext(liste) // Tetikleme

        } catch {
            print(error.localizedDescription)
        }

        db?.close()
    }
    
    func kisileriYukle () {
        
        db?.open()
        var liste = [Kisiler]()
        
        do {
            let result = try db!.executeQuery("SELECT * FROM kisiler", values: nil)
            while result.next() {
                let kisi_id = Int(result.string(forColumn: "kisi_id"))!
                let kisi_ad = result.string(forColumn: "kisi_ad")!
                let kisi_tel = result.string(forColumn: "kisi_tel")!
                
                let kisi = Kisiler(kisi_id: kisi_id, kisi_ad: kisi_ad, kisi_tel: kisi_tel)
                liste.append(kisi)
            }
            kisilerListesi.onNext(liste) // Tetikleme

        } catch {
            print(error.localizedDescription)
        }

        db?.close()
    }
    
}
