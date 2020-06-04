//
//  UpcomingResponse.swift
//  MoviesDB
//
//  Created by NoteROIT on 03/06/20.
//  Copyright © 2020 Notebook. All rights reserved.
//

import Foundation

// MARK: - UpcomingResponse
struct UpcomingResponse: Codable {
    let results: [Result]
    let page, totalResults: Int
    let dates: Dates
    let totalPages: Int

    enum CodingKeys: String, CodingKey {
        case results, page
        case totalResults = "total_results"
        case dates
        case totalPages = "total_pages"
    }
}

// MARK: - Dates
struct Dates: Codable {
    let maximum, minimum: String
}

// MARK: - Result
struct Result: Codable {
    let popularity: Double
    let id: Int
    let video: Bool
    let voteCount, voteAverage: Int
    let title, releaseDate, originalLanguage, originalTitle: String
    let genreIDS: [Int]
    let backdropPath: String?
    let adult: Bool
    let overview, posterPath: String

    enum CodingKeys: String, CodingKey {
        case popularity, id, video
        case voteCount = "vote_count"
        case voteAverage = "vote_average"
        case title
        case releaseDate = "release_date"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case genreIDS = "genre_ids"
        case backdropPath = "backdrop_path"
        case adult, overview
        case posterPath = "poster_path"
    }
}
