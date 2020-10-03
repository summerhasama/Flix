//
//  TrailerCell.swift
//  Flix
//
//  Created by Summer Hasama on 10/2/20.
//

import UIKit

class TrailerCell: UITableViewCell {

    
    @IBOutlet weak var trailerWebView: WKWebView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
