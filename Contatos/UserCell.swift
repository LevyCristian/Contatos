//
//  UserCell.swift
//  Contatos
//
//  Created by Ada 2018 on 17/08/2018.
//  Copyright © 2018 Academy. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var nome: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
