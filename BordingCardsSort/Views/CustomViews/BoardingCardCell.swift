//
//  BoardingCardCell.swift
//  BordingCardsSort
//
//  Created by Marliza Viegas on 04/05/2021.
//

import UIKit

class BoardingCardCell: UITableViewCell {
    @IBOutlet weak var journeyName: UILabel!
    @IBOutlet weak var transportType: UILabel!
    @IBOutlet weak var seatNo: UILabel!
    @IBOutlet weak var transportTypeNumber: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
