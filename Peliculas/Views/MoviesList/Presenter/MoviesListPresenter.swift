//
//  MoviesListPresenter.swift
//  Peliculas
//
//  Created by Sara Francisco on 26/12/21.
//

import UIKit

internal final class MoviesListPresenter {
    
    // MARK: - Variables
    internal var wireframe: MoviesListWireframeInterface?
    internal var view: MoviesListViewInterface?
    internal var interactor: MoviesListInteractorInterface?
    internal var router: MoviesListRouterInterface?
    
    // MARK: - Lifecycle Methods
    init(wireframe: MoviesListWireframeInterface,
         view: MoviesListViewInterface,
         interactor: MoviesListInteractorInterface? = nil,
         router: MoviesListRouterInterface) {
        self.wireframe = wireframe
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

// MARK: - Presenter -
extension MoviesListPresenter: MoviesListPresenterInterface {

    // MARK: - Internal Methods
    func viewDidLoad(){
        wireframe?.setUpViews()
    }
    
    func noResultsViewHidden(hidden: Bool) {
        wireframe?.noResultsViewHidden(hidden: hidden)
    }
    
    func noResultsLoading(searchText: String) {
        wireframe?.noResultsLoading(searchText: searchText)
    }
    
    func noResultsInitialState() {
        wireframe?.noResultsInitialState()
    }
    
    func getData(searchText: String) {
        interactor?.getData(searchText: searchText)
    }
    
    func getImagesaseUrl() {
        interactor?.getImagesBaseUrl()
    }
    
    func navitageToDetail(selectedItem: MovieItem) {
        router?.navitageToDetail(selectedItem: selectedItem)
    }
    
    // MARK: - Private Methods

}
// MARK: - Interactor -
extension MoviesListPresenter: MoviesListOutputInteractorInterface {
    func success(response: MovieList, imageUrl: String) {
        if let resultsSave = response.results {
            if !resultsSave.isEmpty {
                view?.loadData(movies: getItems(movieList: resultsSave, imageUrl: imageUrl))
            } else {
                wireframe?.noResultsView()
            }
        } else {
            wireframe?.noResultsView()
        }
    }
    
    func failure(error: ServiceError) {
        view?.showError(error: error)
        wireframe?.noResultsErrorView()
    }
    
    // MARK: - Internal Methods

    // MARK: - Private Methods
    private func getItems(movieList: [MovieListItem], imageUrl: String) -> [MovieItem] {
        var items: [MovieItem] = []
        movieList.forEach { movie in
            let url = URL(string: imageUrl + movie.posterPath)
            let data = try? Data(contentsOf: url!)
            items.append(MovieItem(image: UIImage(data: data!),
                                   title: movie.title,
                                   description: movie.overview,
                                   voteAverage: NSNumber(value: movie.voteAverage ?? 0.0).stringValue ,
                                   id: movie.id))
        }
        return items
    }
    
}
