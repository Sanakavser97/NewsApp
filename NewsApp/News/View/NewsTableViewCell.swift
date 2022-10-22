//
//  NewsTableViewCell.swift
//  NewsApp
//
//  Created by Sana Kavser  on 21/10/22.
//

import Foundation
import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var borderView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var readTimeLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        borderView.setCustomShadow(cornerRadius: 10, shadowOpacity: 0.4, offset: CGSize(width: 0.0, height: 2.0), shadowRadius: 2.5)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
