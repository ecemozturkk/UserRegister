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
}
