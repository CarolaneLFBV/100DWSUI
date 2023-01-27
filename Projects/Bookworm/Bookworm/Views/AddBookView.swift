//
//  AddBookView.swift
//  Bookworm
//
//  Created by Carolane LEFEBVRE on 27/01/2023.
//

import SwiftUI

struct AddBookView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    
    @State private var title: String = ""
    @State private var author: String = ""
    @State private var genre: String = ""
    @State private var review: String = ""
    @State private var rating: Int = 3
    
    let genres = ["Horror", "Romance", "Kids", "Thriller", "Sci-fi", "Mystery", "Poetry", "Fantasy"]
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Book's informations") {
                    TextField("Book's name", text: $title)
                    TextField("Author", text: $author)
                    
                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) { genre in
                            Text(genre)
                        }
                    }
                }
                
                Section("Write a review") {
                    TextEditor(text: $review)
                    RatingView(rating: $rating)
                }
                
                Section {
                    Button("Save") {
                        let newBook = Book(context: moc)
                        newBook.id = UUID()
                        newBook.title = title
                        newBook.author = author
                        newBook.genre = genre
                        newBook.review = review
                        newBook.rating = Int16(rating)
                        
                        try? moc.save()
                        dismiss()
                    }
                }
            }
            .navigationTitle("New Book")
        }
    }
}

struct AddBookView_Previews: PreviewProvider {
    static var previews: some View {
        AddBookView()
    }
}
