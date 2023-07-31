//
//  AddBookView.swift
//  Bookworm
//
//  Created by Carolane LEFEBVRE on 31/07/2023.
//

import SwiftUI

struct AddBookView: View {
    // moc environment variable
    @Environment(\.managedObjectContext) var moc
    
    // attributes of the book
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var genre = ""
    @State private var review = ""
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Business", "Self-improvement"]
    
    // dismiss feature
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Name of the book", text: $title)
                    TextField("Author's name", text: $author)
                    
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
                        // Create instance of the book
                        let newBook = Book(context: moc)
                        
                        // Set attributes
                        newBook.id = UUID()
                        newBook.title = title
                        newBook.author = author
                        newBook.rating = Int16(rating)
                        newBook.genre = genre
                        newBook.review = review
                        
                        // Save instance
                        try? moc.save()
                        
                        dismiss()
                    }
                }
            }.navigationTitle("Add Book")
        }
    }
}

struct AddBookView_Previews: PreviewProvider {
    static var previews: some View {
        AddBookView()
    }
}
