//
//  UITableView.swift
//  Peliculas
//
//  Created by Sara Francisco on 28/12/21.
//

import UIKit

internal extension UITableView {
    
    /**
     Register a View conforming the ReusableView protocol to a UITableView
     **/
    func register<T: UITableViewCell>(_: T.Type) where T: ReusableCell {
        register(T.self, forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    /**
     Register a View conforming the ReusableView and NibLoadableView protocols to a UITableView
     **/
    func register<T: UITableViewCell>(_: T.Type) where T: ReusableCell, T: NibLoadableView {
        let bundle = Bundle(for: T.self)
        let nib = UINib(nibName: T.nibName, bundle: bundle)
        
        register(nib, forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    /**
     Dequeue a reusable cell conforming the ReusableView protocol
     **/
    func dequeueReusableCell<T: UITableViewCell>(_: T.Type) -> T where T: ReusableCell {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        
        return cell
    }
    
    /**
     Dequeue a reusable cell conforming the ReusableView protocol for an IndexPath
     **/
    func dequeueReusableCell<T: UITableViewCell>(_: T.Type, for indexPath: IndexPath) -> T where T: ReusableCell {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        
        return cell
    }
    
    /**
     Dequeue a reusable cell conforming the ReusableView protocol for a row
     **/
    func dequeueReusableCell<T: UITableViewCell>(_: T.Type, for row: Int) -> T where T: ReusableCell {
        return dequeueReusableCell(T.self, for: IndexPath(row: row, section: 0))
    }
    
    /**
     Get the IndexPath of the cell containing the UIButton
     **/
    func indexPath(for sender: UIButton) -> IndexPath? {
        let buttonPostion = sender.convert(sender.bounds.origin, to: self)
        return self.indexPathForRow(at: buttonPostion)
    }
    
    func isLastVisibleCell(at indexPath: IndexPath) -> Bool {
        guard let lastIndexPath = indexPathsForVisibleRows?.last else { return false }
        return lastIndexPath == indexPath
    }
        
}


