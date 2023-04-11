//
//  TableViewCell.swift
//  Musicsearch
//
//  Created by Park Vladislav on 09.01.2023.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var authorNameLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var albomPictureImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(music: Song) {
        nameLabel.text = music.trackName
        authorNameLabel.text = music.artistName
        albomPictureImageView.sd_setImage(with: URL(string: music.artworkUrl100), completed: nil)
        
    }

}
