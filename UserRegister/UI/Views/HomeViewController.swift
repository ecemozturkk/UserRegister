//
//  ViewController.swift
//  UserRegister
//
//  Created by Ecem Öztürk on 31.07.2023.
//

import UIKit

class HomeViewController: UIViewController, UISearchBarDelegate {
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonDetail(_ sender: Any) {
        let kisi = Kisiler(kisi_id: 1, kisi_ad: "Ecem", kisi_tel: "123")
        performSegue(withIdentifier: "toDetail", sender: kisi)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            // Any -> super class
            // Kisiler -> subclass
            // Downcasting (super -> subclass)
            if let kisi = sender as? Kisiler {
                
                let gidilecekVC = segue.destination as! UserDetailViewController // Downcasting
                gidilecekVC.kisi = kisi
            }
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("Kişi ara: \(searchText)")
    }
    
}

