//  ContentView.swift
//  Movie App Assessment
//
//  Created by Pankaj, Ashutosh, Isiri on 13/09/22.


import SwiftUI
import CachedAsyncImage

struct DetailsView: View {
    let movie: Movie
    
    var body: some View {
        ZStack(alignment: .top){
        
        VStack{
            CachedAsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(movie.backdrop_path)")!)                  .aspectRatio(16/9, contentMode: .fit).padding()

            
//            Image(systemName: "person.fill")
//                .data(url: URL(string: "https://image.tmdb.org/t/p/w500\(movie.backdrop_path)")!)
//                .aspectRatio(16/9, contentMode: .fit).padding()
               
            
            
            Text(movie.overview).padding()

        }
        .navigationBarTitle(movie.title, displayMode: .inline)
        }

    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
// DetailsView(movie: MovieResults)
        
    }
}


