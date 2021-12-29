//
//  MovieCell.swift
//  Peliculas
//
//  Created by Sara Francisco on 28/12/21.
//

import UIKit

class MovieCell: UITableViewCell, ReusableCell, NibLoadableView {

    // MARK: - IBOutlet -

    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var votesLabel: UILabel!
    @IBOutlet weak var img: UIImageView!

    @IBOutlet weak var verticalStack: UIStackView!
    override func awakeFromNib() {
        super.awakeFromNib()
        initViews()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        descLabel.text = ""
        title.text = ""
        votesLabel.text = ""
        img.image = nil
    }
    
    // MARK: - Internal Methods -
    private func initViews() {
        descLabel.textColor = UIColor.white
        descLabel.font = UIFont.italicSystemFont(ofSize: 12)
        title.textColor = UIColor.black
        title.font = UIFont.boldSystemFont(ofSize: 20)
        votesLabel.textColor = UIColor.black
        votesLabel.font = UIFont.systemFont(ofSize: 12)
        img.layer.cornerRadius = 10
        verticalStack.layer.cornerRadius = 10.0
    }
    
}
