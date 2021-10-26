//
//  NoticiasCell.swift
//  consumoApis
//
//  Created by Mac18 on 25/10/21.
//

import UIKit

class NoticiasCell: UITableViewCell {

    @IBOutlet weak var descripcionLabel: UILabel!
    @IBOutlet weak var tituloLabel: UILabel!
    @IBOutlet weak var imagenNoticiaImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
