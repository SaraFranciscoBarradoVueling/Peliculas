//
//  MoviesListViewController.swift
//  Peliculas
//
//  Created by Sara Francisco on 26/12/21.
//

import UIKit

class MoviesListViewController: BaseViewController {
    // MARK: - IBOutlets

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var noResultsView: UIView!
    
    @IBOutlet weak var noResultsImageView: UIImageView!
    @IBOutlet weak var noResultsLabel: UILabel!
    
    // MARK: - Variables
    var presenter: MoviesListPresenterInterface?
    var filteredTableData = [String]()
    var resultSearchController = UISearchController()
    var keyWordSearchText = ""
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        self.tableView.reloadData()
    }
    
    // MARK: -IBActions

    
    
}
// MARK: - View -
extension MoviesListViewController: MoviesListViewInterface {
    
}
extension MoviesListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("searchText",searchText)
        keyWordSearchText = searchText
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        presenter?.wireframe?.noResultsInitialState()
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        //llamas al servicio pones un loader y cuando tengas los datos recargas la tabla
        presenter?.noResultsLoading(searchText: keyWordSearchText)
        presenter?.getData(searchText: keyWordSearchText)
    }
}
