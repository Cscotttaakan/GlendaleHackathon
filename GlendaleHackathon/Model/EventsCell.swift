//
//  EventsCell.swift
//  GlendaleHackathon
//
//  Created by Craig Scott on 9/21/18.
//  Copyright © 2018 Craig Scott. All rights reserved.
//

import UIKit

class EventsCell: UITableViewCell {
    @IBOutlet weak var eventName: UILabel!
    
    @IBOutlet weak var eventDate: UILabel!
    @IBOutlet weak var eventTime: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configureCell(event : Event){
        DispatchQueue.main.async {
            self.eventName.text = "\(event.eventName!)"
            self.eventDate.text = "\(event.eventDate!)"
            self.eventTime.text = "\(event.eventTime!)"
            self.eventName.adjustsFontSizeToFitWidth = true
        }
    }

}
