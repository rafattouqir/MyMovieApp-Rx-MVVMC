//
//  APIManager.swift
//  MyMovieApp
//
//  Created by RAFAT TOUQIR RAFSUN on 7/7/19.
//  Copyright © 2019 RAFAT TOUQIR RAFSUN. All rights reserved.
//

import Foundation


final class APIManager{
  
  static let shared = APIManager()
  
  func getDiscoverMovies(url:String, _ completion: @escaping (Page<Movie>?) -> Void) {
    
    let completionOnMainThread = { result in
      DispatchQueue.main.async {
        completion(result)
      }
    }
    
    guard let url = URL(string: "\(url)?api_key=\(Urls.API_KEY)") else {
      completion(nil)
      return
    }
    
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
      
      if error != nil {
        completionOnMainThread(nil)
        return
      }
      
      guard let response = response as? HTTPURLResponse else {
        completionOnMainThread(nil)
        return
      }
      
      guard response.statusCode == 200 || response.statusCode == 304 else {
        completionOnMainThread(nil)
        return
      }
      
      guard let data = data else {
        completionOnMainThread(nil)
        return
      }
      
      do {
        let model = try JSONDecoder().decode(Page<Movie>.self, from: data)
        completionOnMainThread(model)
      } catch {
        completionOnMainThread(nil)
      }
    }
    
    task.resume()
  }
  
  
}
