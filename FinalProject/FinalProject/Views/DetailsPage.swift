//
//  DetailsPage.swift
//  FinalProject
//
//  Created by salo khizanishvili on 19.09.22.
//

import UIKit

class DetailsPage: UIViewController {
    var movie: Movie!
    
    @IBOutlet weak var movieTitleLbl: UILabel!
    @IBOutlet weak var movieYearLbl: UILabel!
    @IBOutlet weak var movieOverviewLbl: UILabel!
    @IBOutlet weak var moviePosterView: UIImageView!
    @IBOutlet weak var movieRatingLbl: UILabel!
    
    private var urlString: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()

       configure()
    }
    
    private func configure() {
        movieTitleLbl.text = movie.title
        movieYearLbl.text = movie.year
        movieOverviewLbl.text = movie.overview
        guard let rate = movie.rate else {return}
        self.movieRatingLbl.text = String(rate)
        guard let posterString = movie.posterImage else {return}
        urlString = "https://image.tmdb.org/t/p/w300" + posterString
        
        guard let posterImageURL = URL(string: urlString) else {
            self.moviePosterView.image = UIImage(named: "noImageAvailable")
            return
        }
        self.moviePosterView.image = nil
        
        getImageDataFrom(url: posterImageURL)
        
    }
    
    public func getImageDataFrom(url: URL) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            // Handle Error
            if let error = error {
                print("DataTask error: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else {
                // Handle Empty Data
                print("Empty Data")
                return
            }
            
            DispatchQueue.main.async {
                if let image = UIImage(data: data) {
                    self.moviePosterView.image = image
                }
            }
        }.resume()
    }
}
