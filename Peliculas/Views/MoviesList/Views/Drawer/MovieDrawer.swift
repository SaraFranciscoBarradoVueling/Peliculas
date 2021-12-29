//
//  MovieDrawer.swift
//  Peliculas
//
//  Created by Sara Francisco on 28/12/21.
//

import Foundation
import UIKit

internal final class MovieDrawer: CellDrawer {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.register(MovieCell.self)
        return tableView.dequeueReusableCell(MovieCell.self, for: indexPath)
    }
    
    func drawCell(_ cell: UITableViewCell, withItem item: Any) {
        guard let cell = cell as? MovieCell,
              let item = item as? MovieItem else {
            return
        }
        cell.votesLabel.text = item.voteAverage
        cell.title.text = item.title
        cell.descLabel.text = item.description
        cell.selectionStyle = .none
        cell.img.image = item.image
    }
}

// MARK: - DrawerItemProtocol -

extension MovieItem: DrawerItem {
    var cellDrawer: CellDrawer {
        return MovieDrawer()
    }
}
