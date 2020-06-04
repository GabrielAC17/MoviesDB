//
//  MainTableViewController.swift
//  MoviesDB

import UIKit

class MainTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    @IBOutlet weak var tableView: UITableView!
    
    var movieDAO : MovieDBDAO!
    var list: Array<Result>!
    
    var movieDetails: MovieDetailsResponse!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.list = Array<Result>()
        movieDAO = MovieDBDAO()
        movieDAO.loadList { (response) in
            if response != nil {
                self.list = response
                self.tableView.reloadData()
            }
        }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mainTableCell", for: indexPath) as! MainTableViewCell
        let result = self.list[indexPath.row]
        
        cell.titleLbl.text = result.originalTitle
        cell.descriptionLbl.text = result.overview
        cell.releaseLbl.text = result.releaseDate
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let result = self.list[indexPath.row]
        
        self.movieDAO.movieDetails(id: result.id) { (movieDetails) in
            if (movieDetails != nil){
                self.movieDetails = movieDetails
                self.performSegue(withIdentifier: "detailsSegue", sender: self)
            }
        }
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         if (segue.identifier == "detailsSegue") {
            if let vc: MovieDetailsViewController = segue.destination as? MovieDetailsViewController {
                vc.movieDetails = self.movieDetails
            }
            
        }
    }
    

}
