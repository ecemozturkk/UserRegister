//
//  ViewController.swift
//  UserRegister
//
//  Created by Ecem Öztürk on 31.07.2023.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var usersTableView: UITableView!
    
    var kisilerListesi = [Kisiler]()
    var viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        
        usersTableView.delegate = self
        usersTableView.dataSource = self
        
        _ = viewModel.kisilerListesi.subscribe(onNext: { liste in
            self.kisilerListesi = liste
            self.usersTableView.reloadData()
        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.kisileriYukle()
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
}

extension HomeViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.ara(aramaKelimesi: searchText)
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return kisilerListesi.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let user = kisilerListesi[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell") as! UsersTableViewCell
        cell.lblUserName.text = user.kisi_ad
        cell.lblUserPhone.text = user.kisi_tel
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user = kisilerListesi[indexPath.row]
        performSegue(withIdentifier: "toDetail", sender: user)
        tableView.deselectRow(at: indexPath, animated: true)

    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete"){contextualAction, view, bool in
            let user = self.kisilerListesi[indexPath.row]
            
            let alert = UIAlertController(title: "Delete User", message: "Do you want to delete \(user.kisi_ad!)?", preferredStyle: .alert)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
            alert.addAction(cancelAction)
            
            let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { action in
                self.viewModel.sil(kisi_id: user.kisi_id!)
            }
            alert.addAction(deleteAction)
            self.present(alert, animated: true)
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
}
