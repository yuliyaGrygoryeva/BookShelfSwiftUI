//
//  BookListView.swift
//  BookShelfSwiftUI
//
//  Created by Yuliya  on 7/7/22.
//

import SwiftUI

struct BookListView: View {
    
    let backgroundGradient = LinearGradient(
        gradient: Gradient(colors: [Color.green, Color.white]),
        startPoint: .top, endPoint: .bottom)
    
    @ObservedObject var bookViewModel = BookViewModel()

    var body: some View {
        ZStack {
            
            NavigationView {
                List {
                    ForEach(bookViewModel.books) { book in
                        NavigationLink {
                            BookDetailsView(book: .constant(book))
                        } label: {
                            HStack{
                                Image(book.coverArt)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 80)
                                    .padding(.vertical)
                                
                                VStack(alignment: .leading, spacing: 10){
                                    Text(book.title)
                                        .bold()
                                        .lineLimit(1)
                                    Text(book.author)
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                        
                                    ProgressBar()
                                    
                                    HStack{
                                        Image(systemName: "heart")
                                        Text("100")
                                        Image(systemName: "message")
                                        Text("50")
                                    }
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                }.padding()
                               
                            }
                        }
                        
                    }
                    .onDelete(perform: bookViewModel.deleteBook(index:))
                    .listRowBackground(backgroundGradient)
                        
                }
                .listStyle(.plain)
                .navigationTitle("Book Shelf")
                
            }
            .accentColor(.black)
        }
        
    }
}
struct BookListView_Previews: PreviewProvider {
    static var previews: some View {
        BookListView()
    }
}


struct ProgressBar: View {

  var body: some View {
    ZStack(alignment: .leading) {
      Capsule().frame(width: 100, height: 5)
        .opacity(0.3)
        .foregroundColor(.gray)
      Capsule().frame(width: 50, height: 5)
        .foregroundColor(.orange)
    }
  }
}
