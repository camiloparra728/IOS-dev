//
//  TableViewCell.swift
//  co.pokeApp
//
//  Created by wayne on 7/06/20.
//  Copyright © 2020 wayne. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var imagePokemon: UIImageView!
    @IBOutlet weak var namePokemon: UILabel!
    @IBOutlet weak var idPokemon: UILabel!
    
    @IBOutlet weak var firstAbility: UIImageView!
    @IBOutlet weak var secondAbility: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    

}
