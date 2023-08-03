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
    
    var usersList = [Kisiler]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        
        usersTableView.delegate = self
        usersTableView.dataSource = self
        
        let k1 = Kisiler(kisi_id: 1, kisi_ad: "aaa", kisi_tel: "1111")
        let k2 = Kisiler(kisi_id: 2, kisi_ad: "aasd", kisi_tel: "222")
        let k3 = Kisiler(kisi_id: 3, kisi_ad: "fdg", kisi_tel: "333")
        let k4 = Kisiler(kisi_id: 4, kisi_ad: "asf", kisi_tel: "4444")
        let k5 = Kisiler(kisi_id: 5, kisi_ad: "aasfg", kisi_tel: "")
        let k6 = Kisiler(kisi_id: 6, kisi_ad: "aghfgh", kisi_tel: "1111")
        usersList.append(k1)
        usersList.append(k2)
        usersList.append(k3)
        usersList.append(k4)
        usersList.append(k5)
        usersList.append(k6)
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
        print("Kişi ara: \(searchText)")
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usersList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let user = usersList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell") as! UsersTableViewCell
        cell.lblUserName.text = user.kisi_ad
        cell.lblUserPhone.text = user.kisi_tel
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user = usersList[indexPath.row]
        performSegue(withIdentifier: "toDetail", sender: user)
        tableView.deselectRow(at: indexPath, animated: true)

    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete"){contextualAction, view, bool in
            let user = self.usersList[indexPath.row]
            
            let alert = UIAlertController(title: "Delete User", message: "Do you want to delete \(user.kisi_ad!)?", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
            alert.addAction(cancelAction)
            let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { action in
                print("Kişi sil \(user.kisi_id!)")
            }
            alert.addAction(deleteAction)
            self.present(alert, animated: true)
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
}
