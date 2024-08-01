//
//  AddBookView.swift
//  Bookworm
//
//  Created by Kenji Dela Cruz on 7/30/24.
//

import SwiftUI

struct AddBookView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss

    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var genre = "Fantasy"
    @State private var review = ""
    @State private var publisher = ""
    
    private var hasInvalidInfo: Bool {
        return title.isEmpty || author.isEmpty
    }
    
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Name of book", text: $title)
                    TextField("Author's name", text: $author)
                    TextField("Publisher's name", text: $publisher)
                    
                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section("Write a review") {
                    TextEditor(text: $review)
                    RatingView(rating: $rating)
                }
                
                Section {
                    Button("Save") {
                        let newBook = Book(title: title, author: author, genre: genre, review: review, rating: rating, publisher: publisher)
                        modelContext.insert(newBook)
                        dismiss()
                    }
                }
                .disabled(hasInvalidInfo)
            }
        }.navigationTitle("Add Book")
    }
}

#Preview {
    AddBookView()
}
