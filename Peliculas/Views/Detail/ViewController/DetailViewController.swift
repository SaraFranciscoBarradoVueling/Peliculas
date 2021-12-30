//
//  DetailViewController.swift
//  Peliculas
//
//  Created by Sara Francisco on 29/12/21.
//

import UIKit

class DetailViewController: BaseViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var votesLabel: UILabel!
    @IBOutlet weak var imgMovie: UIImageView!
    @IBOutlet weak var descLabel: UILabel!
    
    var data: MovieItem!
    
    // MARK: - Variables
    var presenter: DetailPresenterInterface?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        data = presenter?.getItem()
        loadData()
    }
    
    private func loadData() {
        titleLabel.text = data.title
        votesLabel.text = data.voteAverage
        imgMovie.image = data.image
        descLabel.text = data.description
    }
}
    // MARK: - View -
    extension DetailViewController: DetailViewInterface {

}
