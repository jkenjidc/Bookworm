//
//  Book.swift
//  Bookworm
//
//  Created by Kenji Dela Cruz on 7/30/24.
//
import SwiftData
import Foundation

@Model
class Book {
    var title: String
    var author: String
    var genre: String
    var review: String
    var rating: Int
    var date: String?
    
    init(title: String, author: String, genre: String, review: String, rating: Int, date: String? = "") {
        self.title = title
        self.author = author
        self.genre = genre
        self.review = review
        self.rating = rating
        self.date = Date.now.formatted(date: .abbreviated, time: .omitted)
    }
}
