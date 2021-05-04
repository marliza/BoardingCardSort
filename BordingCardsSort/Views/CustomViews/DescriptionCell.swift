//
//  DescriptionCell.swift
//  BordingCardsSort
//
//  Created by Marliza Viegas on 04/05/2021.
//

import UIKit

class DescriptionCell: UITableViewCell {
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var stepNo: UILabel!
    @IBOutlet weak var circleView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // make the view circluar
        self.circleView.layer.cornerRadius = self.circleView.frame.height / 2
        self.circleView.clipsToBounds = true
        self.circleView.layer.borderColor = UIColor.systemGreen.cgColor
        self.circleView.layer.borderWidth = 3
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
