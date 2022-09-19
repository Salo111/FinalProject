//
//  MovieViewController.swift
//  FinalProject
//
//  Created by salo khizanishvili on 19.09.22.
//

import UIKit

class MovieViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    private var viewModel = MovieViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        loadPopularMoviesData()
    }
    
    private func loadPopularMoviesData() {
        viewModel.fetchPopularMoviesData { [weak self] in
            self?.tableView.dataSource = self
            self?.tableView.delegate = self
            self?.tableView.reloadData()
        }
    }
}

// MARK: - TableView
extension MovieViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRowsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MovieTableViewCell
        let movie = viewModel.cellForRowAt(indexPath: indexPath)
        cell.setCellWithValuesOf(movie)
        let viewController = storyboard?.instantiateViewController(identifier: "DetailsPage") as! DetailsPage
        viewController.moviePosterView = cell.moviePoster
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = storyboard?.instantiateViewController(identifier: "DetailsPage") as! DetailsPage
        let movie = viewModel.cellForRowAt(indexPath: indexPath)
        viewController.movie = movie
        navigationController?.pushViewController(viewController, animated: true)
    }
}
