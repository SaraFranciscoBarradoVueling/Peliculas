//
//  DetailPresenter.swift
//  Peliculas
//
//  Created by Sara Francisco on 29/12/21.
//

import UIKit

internal final class DetailPresenter {
    
    // MARK: - Variables
    internal var wireframe: DetailWireframeInterface?
    internal var view: DetailViewInterface?
    internal var router: DetailRouterInterface?
    var item: MovieItem!
    
    // MARK: - Lifecycle Methods
    init(wireframe: DetailWireframeInterface,
         view: DetailViewInterface,
         router: DetailRouterInterface,
         item: MovieItem) {
        self.wireframe = wireframe
        self.view = view
        self.router = router
        self.item = item
    }
}

// MARK: - Presenter -
extension DetailPresenter: DetailPresenterInterface {
    func getItem()-> MovieItem {
        return item
    }
 
    // MARK: - Internal Methods
    func viewDidLoad(){
        wireframe?.setUpViews()
    }
    
    // MARK: - Private Methods
    

}
