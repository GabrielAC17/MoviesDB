//
//  MovieDBDAO.swift
//  MoviesDB
//
//  Created by NoteROIT on 03/06/20.
//  Copyright © 2020 Notebook. All rights reserved.
//

import Foundation


class MovieDBDAO {
    func loadList(actionResponse: @escaping (_ response:Array<Result>?) -> Void){
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/upcoming?api_key=ea24fd6f9092eaa1c383d5d150398824&language=pt-BR&page=1&region=BR") else {
            print("Invalid URL")
            return
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode(UpcomingResponse.self, from: data) {
                    // we have good data – go back to the main thread
                    DispatchQueue.main.async {
                        actionResponse(decodedResponse.results)
                    }

                    // everything is good, so we can exit
                    return
                }
                else{
                    actionResponse(nil)
                }
            }
            else{
                actionResponse(nil)
            }
        }.resume()
    }
    
    func movieDetails(id:Int, actionResponse: @escaping (_ response:MovieDetailsResponse?) -> Void){
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/" + String(id) + "?api_key=ea24fd6f9092eaa1c383d5d150398824&language=pt-BR") else {
            print("Invalid URL")
            return
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode(MovieDetailsResponse.self, from: data) {
                    // we have good data – go back to the main thread
                    DispatchQueue.main.async {
                        actionResponse(decodedResponse)
                    }

                    // everything is good, so we can exit
                    return
                }
                else{
                    actionResponse(nil)
                }
            }
            else{
                actionResponse(nil)
            }
        }.resume()
    }
}


