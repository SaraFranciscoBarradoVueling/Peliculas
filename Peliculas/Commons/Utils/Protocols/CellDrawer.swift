//
//  CellDrawer.swift
//  Peliculas
//
//  Created by Sara Francisco on 28/12/21.
//

import UIKit

internal protocol CellDrawer {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    func drawCell(_ cell: UITableViewCell, withItem item: Any)
    
    func collectionView(_ collectionView: UICollectionView, cellForRowAt indexPath: IndexPath) -> UICollectionViewCell
    func drawCell(_ cell: UICollectionViewCell, withItem item: Any)
    
    func tableView(_ tableView: UITableView) -> UITableViewHeaderFooterView
    func drawCell(_ cell: UITableViewHeaderFooterView, withItem item: Any, section: Int)

}

extension CellDrawer {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { return UITableViewCell() }
    func drawCell(_ cell: UITableViewCell, withItem item: Any) { }
    
    func collectionView(_ collectionView: UICollectionView, cellForRowAt indexPath: IndexPath) -> UICollectionViewCell { return UICollectionViewCell()}
    func drawCell(_ cell: UICollectionViewCell, withItem item: Any) { }
    
    func tableView(_ tableView: UITableView) -> UITableViewHeaderFooterView { return UITableViewHeaderFooterView() }
    func drawCell(_ cell: UITableViewHeaderFooterView, withItem item: Any, section: Int) { }
}

