//
//  ReusableCell.swift
//  Peliculas
//
//  Created by Sara Francisco on 28/12/21.
//

import UIKit

internal protocol ReusableCell: class {
    static var reuseIdentifier: String { get }
}

extension ReusableCell where Self: UIView {
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
