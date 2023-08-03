//
//  UsersTableViewCell.swift
//  UserRegister
//
//  Created by Ecem Öztürk on 3.08.2023.
//

import UIKit

class UsersTableViewCell: UITableViewCell {

    @IBOutlet weak var lblUserPhone: UILabel!
    @IBOutlet weak var lblUserName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
