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
    var basesUrlISCalled: Bool = false
    
    private var cells: [MovieItem] = []
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.getImagesaseUrl()
        presenter?.viewDidLoad()
    }
    
    // MARK: -IBActions

    
    
}
// MARK: - View -
extension MoviesListViewController: MoviesListViewInterface {
    
    func loadData(movies: [MovieItem]) {
        self.cells = movies
        presenter?.noResultsViewHidden(hidden: true)
        noResultsView.isHidden = true
        tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate
extension MoviesListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return cells.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard !cells.isEmpty else { return UITableViewCell() }
        let item = cells[indexPath.row]
        let drawer = item.cellDrawer
        let cell = drawer.tableView(tableView, cellForRowAt: indexPath)
        drawer.drawCell(cell, withItem: item)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedItem = cells[indexPath.row]
        presenter?.navitageToDetail(selectedItem: selectedItem)
    }
}

extension MoviesListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("searchText",searchText)
        keyWordSearchText = searchText
        presenter?.noResultsViewHidden(hidden: true)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        if cells.isEmpty {
            presenter?.noResultsInitialState()
        }
    }
     
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        //llamas al servicio pones un loader y cuando tengas los datos recargas la tabla
        presenter?.noResultsLoading(searchText: keyWordSearchText)
        presenter?.getData(searchText: keyWordSearchText)
    }
}
