//
//  MovieDetailsViewController.swift
//  MoviesDB
//
//  Created by NoteROIT on 03/06/20.
//  Copyright © 2020 Notebook. All rights reserved.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var genreslbl: UILabel!
    @IBOutlet weak var producersLbl: UILabel!
    @IBOutlet weak var releaseLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    
    public var movieDetails: MovieDetailsResponse!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.titleLbl.text = movieDetails.title
        
        var genres = "";
        for genre in movieDetails.genres{
            genres += genre.name + ", "
        }
        self.genreslbl.text = genres
        
        var producers = "";
        for producer in movieDetails.productionCompanies{
            producers += producer.name + ", "
        }
        self.producersLbl.text = producers
        
        self.releaseLbl.text = movieDetails.releaseDate
        self.descriptionLbl.text = movieDetails.overview
        
        if let url = URL(string: "https://image.tmdb.org/t/p/w185" + movieDetails.posterPath){
            self.downloadImage(from: url)
        }
    }
    
    func downloadImage(from url: URL) {
        print("Download Started")
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            print(response?.suggestedFilename ?? url.lastPathComponent)
            print("Download Finished")
            DispatchQueue.main.async() { [weak self] in
                self?.imageView.image = UIImage(data: data)
            }
        }
    }
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
