//
//  MoviesListViewController.swift
//  Peliculas
//
//  Created by Sara Francisco on 26/12/21.
//

import UIKit

class MoviesListViewController: BaseViewController {
    
    // MARK: - IBOutlets

    
    // MARK: - Variables
    var presenter: MoviesListPresenterInterface?
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        presenter?.viewDidLoad()
    }
    
    // MARK: -IBActions

    
    
}
// MARK: - View -
extension MoviesListViewController: MoviesListViewInterface {
    
}
