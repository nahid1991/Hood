//
//  ChannelCell.swift
//  Hood
//
//  Created by Nahid on 22/10/19.
//  Copyright © 2019 Nahid. All rights reserved.
//

import UIKit

class ChannelCell: UITableViewCell {
    //Outlets
    @IBOutlet weak var channelName: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {
            self.layer.backgroundColor = UIColor(white: 1, alpha: 0.2).cgColor
        } else {
            self.layer.backgroundColor = UIColor.clear.cgColor
        }
    }
    
    func configureCell(channel: Channel) {
        let title = channel.channelTitle ?? ""
        channelName.text = "#\(title)"
        channelName.font = UIFont(name: "AvenirNext-Regular", size: 17)
        
        for id in MessageService.instance.unreadChannels {
            if id == channel.id {
                self.channelName.font = UIFont(name: "AvenirNext-Bold", size: 22)
            }
        }
    }

}
