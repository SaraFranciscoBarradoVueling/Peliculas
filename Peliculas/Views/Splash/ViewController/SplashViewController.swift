//
//  SplashViewController.swift
//  Peliculas
//
//  Created by Sara Francisco on 27/12/21.
//

import UIKit

class SplashViewController: BaseViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var loadingImageView: UIImageView!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var errorView: UIView!
    @IBOutlet weak var errorLabel: UILabel!
    
    // MARK: - Variables
    var presenter: SplashPresenterInterface?
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        presenter?.viewDidLoad()
    }
    
    // MARK: -IBActions
    @IBAction func errorButtonAction(_ sender: Any) {
        presenter?.viewDidLoad()
    }
    
    
}
// MARK: - View -
extension SplashViewController: SplashViewInterface {
    
}
