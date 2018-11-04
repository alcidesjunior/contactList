//
//  TableViewCell.swift
//  TryCoreData
//
//  Created by Alcides Junior on 31/10/18.
//  Copyright © 2018 Alcides Junior. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var labelNome: UILabel!
    @IBOutlet weak var labelTelefone: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
