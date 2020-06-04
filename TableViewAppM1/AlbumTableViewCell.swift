//
//  AlbumTableViewCell.swift
//  TableViewAppM1
//
//  Created by user156499 on 6/1/20.
//  Copyright © 2020 MZN0047. All rights reserved.
//

import UIKit

class AlbumTableViewCell: UITableViewCell {

    var album: String = "" {
        didSet {
            if (album != oldValue) {
                albumLabel.text = album
            }
        }
    }
    var artist: String = "" {
        didSet {
            if (artist != oldValue) {
                artistLabel.text = artist
            }
        }
    }
    var year: String = "" {
        didSet {
            if (year != oldValue) {
                yearLabel.text = year
            }
        }
    }
    var label: String = "" {
        didSet {
            if (label != oldValue) {
                labelLabel.text = label
            }
        }
    }
    var art: UIImage? = nil {
        didSet {
            if (art != oldValue) {
                artLabel.image = art
            }
        }
    }
    @IBOutlet weak var artLabel: UIImageView!
    @IBOutlet var albumLabel: UILabel!
    @IBOutlet var artistLabel: UILabel!
    @IBOutlet var yearLabel: UILabel!
    @IBOutlet var labelLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.albumLabel.highlightedTextColor = UIColor.red
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
        //albumLabel.textColor = UIColor.red
    }
    
    

}
