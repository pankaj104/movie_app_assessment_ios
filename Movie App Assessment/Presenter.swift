//
//  Presenter.swift
//  Movie App Assessment
//
//  Created by Pankaj Kumar on 24/09/22.
//

import Foundation
import UIKit
import SwiftUI


protocol PopularMoviesPresenter: AnyObject{
   // var objectWillChange: ObservableObjectPublisher { get }
  // The list of movies

    func fetchData()
}


class ItemsPresenter: PopularMoviesPresenter, ObservableObject {
    
    @Published var movielist = [Movie]()
    let apilink: LocalizedStringKey = "apilink"
    let api = String(localized: "apilink") // to change in string type
    func fetchData(){
        
        if let url = URL(string: api){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with:  url) { (data, response, error) in
                if error == nil{
                    let decoder = JSONDecoder()
                    if let safeData = data{
                        do{
                            let movieResults = try decoder.decode(MovieResults.self, from: safeData)
                            DispatchQueue.main.async {
                                self.movielist = movieResults.results
                            }
                        }
                        catch{
                            print(error )
                        }
                    }
                }
            }
            task.resume()
        }
    }

}




