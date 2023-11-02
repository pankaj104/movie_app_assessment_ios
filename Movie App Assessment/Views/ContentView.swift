//  ContentView.swift
//  Movie App Assessment
//
//  Created by Pankaj, Ashutosh, Isiri on 13/09/22.

import SwiftUI
import CachedAsyncImage
import UIKit


struct ContentView: View {
   // var presenter = ItemsPresenter() // check out @ObservedObject
    @ObservedObject  var presenter = ItemsPresenter()

    
    

    let text1:LocalizedStringKey = "appName"
   // @ObservedObject  var networkManager = NetworkManager()
    @State private var searchText = ""

    var body: some View {
        NavigationView{
            let filteredPost = presenter.movielist
            let postapi = filteredPost.filter{$0.title.contains(searchText)}
            
            List(searchText == "" ? filteredPost : postapi ){ post in
                NavigationLink(destination: DetailsView(movie: post)) {
                    VStack {
                        HStack {
                            
                            CachedAsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(post.backdrop_path)")!){ image in
                                image.resizable()}
                             placeholder: {
                                ProgressView()
                            }
                            .frame(width: 150, height: 120)
                                                            
                            
//                            Image(systemName: "multiply.circle.fill")
//                                .data(url: URL(string: "https://image.tmdb.org/t/p/w500\(post.backdrop_path)")!)
//                                .frame(width: 120.0, height: 100.0)
                            
                            
                            VStack {
                                Text(post.title)
                                Text(String(post.release_date))
                            }
                        }
                    }
                }
                
            }
            
            .navigationBarTitle(text1,displayMode: .inline)
            
             .searchable(text: $searchText)
        }
        .onAppear {
            self.presenter.fetchData()
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
EmptyView()
        
    }
}

extension Image {
    
    func data(url:URL) -> Self {
        
        if let data = try? Data(contentsOf: url) {
            
            return Image(uiImage: UIImage(data: data)!)
                .resizable()
        }
        return self
            .resizable()
    }
    
}

extension URLCache {
    
    static let imageCache = URLCache(memoryCapacity: 512*1000*1000, diskCapacity: 10*1000*1000*1000)
}



