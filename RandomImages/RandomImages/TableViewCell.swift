//
//  TableViewCell.swift
//  RandomImages
//
//  Created by Kaique de Souza Monteiro on 21/07/19.
//  Copyright © 2019 Kaique de Souza Monteiro. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage


class TableViewCell: UITableViewCell {

    @IBOutlet weak var author: UILabel!

    @IBOutlet weak var photo: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configure(imageUrl: String?, author: String?) {
        let url = URL(string: imageUrl!)
        photo.af_setImage(withURL: url!)
        self.author.text = author
    }

}
