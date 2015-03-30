//
//  TachesCell.swift
//  TaskIt
//
//  Created by PHILIPPE PESCATORE 2 on 25/03/2015.
//  Copyright (c) 2015 iAtelier. All rights reserved.
//

import UIKit

class TachesCell: UITableViewCell {
    
    
    @IBOutlet weak var etiquetteTache: UILabel!
    @IBOutlet weak var etiquetteDate: UILabel!
    @IBOutlet weak var etiquetteSousTache: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
