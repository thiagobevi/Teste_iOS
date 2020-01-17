//
//  MoviesListService.swift
//  TestTMBD
//
//  Created by Thiago Bevilacqua on 12/23/19.
//  Copyright © 2019 Thiago Bevilacqua. All rights reserved.
//

import Foundation
import Alamofire

protocol MovieListServiceProtocol {
    
    func requestAuth(parameters: Parameters, completion: @escaping (Token?) -> ())
    func moviesList(page: Int, completion: @escaping (MovieResponse?) -> ())
}

class MoviesListService: MovieListServiceProtocol {
    func requestAuth(parameters: Parameters, completion: @escaping (Token?) -> ()) {
        
    }
    
    //var movies: [Movie]?
    var token: Token?
    let headers = ["content-type": "application/json"]
    let parameters = [
        "username": "thiagobevi",
        "password": "thiago22",
        "request_token": "f304fe23960aeccc518b0879a152e5d3c8a0b32c"]
    
    var tokenAuth = "https://api.themoviedb.org/3/authentication/token/validate_with_login?api_key=4f3cb82e06a1124218f505eca21fa375"
    var popularURL = "https://api.themoviedb.org/3/movie/popular?api_key=4f3cb82e06a1124218f505eca21fa375&language=en-US&page="
    
    
    
    //    func requestAuth(parameters: Parameters, completion: @escaping (Token?) -> ()) {
    //        let request = Alamofire.request("https://api.themoviedb.org/3/authentication/token/validate_with_login?api_key=4f3cb82e06a1124218f505eca21fa375", parameters: parameters)
    //        request.responseJSON { response in
    //            if response.result.isSuccess {
    //                print("Succes Data Recive")
    //
    //                do {
    //                    let decoded = try JSONDecoder().decode(Token.self, from: response.data!)
    //                    completion(decoded)
    //
    //                } catch {
    //                    print(error)
    //                }
    //            } else {
    //                print("Error get data")
    //            }
    //        }
    //    }
    
    func moviesList(page: Int, completion: @escaping (MovieResponse?) -> ())  {
        
        var completeURL = popularURL + String(page)
        let request = Alamofire.request(completeURL, method: .get)
        request.responseJSON { response in
            if response.result.isSuccess {
                print("Print Movies List")
                do {
                    let decoded = try JSONDecoder().decode(MovieResponse.self, from: response.data!)
                    completion(decoded)
                    
                } catch {
                    print(error)
                }
            } else {
                completion(nil)
            }
        }
    }
    
    func searchMovieData(text: String, page: Int, completion: @escaping (MovieResponse?) -> ()) {
        let request = Alamofire.request("https://api.themoviedb.org/3/search/movie?api_key=4f3cb82e06a1124218f505eca21fa375&language=en-US&query=\(text)&page=\(page)&include_adult=false", method: .get)
        request.responseJSON { response in
            if response.result.isSuccess {
                print("Search Result OK")
                
                do {
                    let decoded = try JSONDecoder().decode(MovieResponse.self, from: response.data!)
                    completion(decoded)
                } catch {
                    print(error)
                }
            } else {
                completion(nil)
            }
        }
    }
    
    
    
}

struct Token: Codable {
    var success: Bool?
    var expires_at: String?
    var request_token: String?
    
}
