//
//  ApiCaller.swift
//  Netflix
//
//  Created by Mesum Syed on 19/11/2022.
//

import Foundation

struct Constant {
    static let API_KEY = "72a92a904702629a345d21c3e4fe58ed"
    static let baseUrl = "https://api.themoviedb.org/"
}

enum ApiError : Error {
   case failedToGetData
}

class ApiCaller {
    static let shared = ApiCaller()
    
    func getTrendingMovies(completion : @escaping (Result<[Movie], Error>) -> Void ){
        
        guard let url = URL(string: "\(Constant.baseUrl)/3/trending/movie/day?api_key=\(Constant.API_KEY)")else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)){
            data, _, error in guard let  data = data, error == nil else{
                return
            }
            do{
                //   let result = try JSONSerialization.jsonObject(with: data, options: //.fragmentsAllowed)
                //   print(result)
                let result = try JSONDecoder().decode(TrendingMoviesResponse.self, from: data)
                completion(.success(result.results))
                print(result.results[0].original_name)
                
            }catch{
                completion(.failure(error))
                print(error)
            }
        }
        task.resume()
    }
    
    
    func getTrendingTvs(completion: @escaping (Result<[Movie], Error>) -> Void){
        guard let url = URL(string: "\(Constant.baseUrl)/3/trending/tv/day?api_key=\(Constant.API_KEY)") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)){ data,  _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let  results = try JSONDecoder().decode(TrendingTvResponse.self, from: data)
                completion(.success(results.results))
                //                let results = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
                //                print(results)
                //            }
            }
            catch {
                print(error.localizedDescription)
                completion(.failure(error))
            }
            
        }
        
        task.resume()
    }
    
    
    func getUpcomingMovie(completion: @escaping (Result<[Movie], Error>) -> Void){
        
        guard let url = URL(string: "\(Constant.baseUrl)/3/movie/upcoming?api_key=\(Constant.API_KEY)&language=en-US&page=1") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)){ data,  _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let  results = try JSONDecoder().decode(TrendingMoviesResponse.self, from: data)
                completion(.success(results.results))

                print(results)
                //                let results = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
                //                print(results)
                //            }
            }
            catch {
                print(error.localizedDescription)
                completion(.failure(error))
            }
            
            
            
            
        }
        task.resume()

        
    }
    
    
    
    func getPopularMovies(completion: @escaping (Result<[Movie], Error>) -> Void){
        
        guard let url = URL(string: "\(Constant.baseUrl)/3/movie/popular?api_key=\(Constant.API_KEY)&language=en-US&page=1") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)){ data,  _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let  results = try JSONDecoder().decode(TrendingMoviesResponse.self, from: data)
                completion(.success(results.results))

                print(results)
                //                let results = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
                //                print(results)
                //            }
            }
            catch {
                print(error.localizedDescription)
                completion(.failure(error))
            }
            
            
            
            
        }
        task.resume()

        
    }
    
    func getTopRated(completion: @escaping (Result<[Movie], Error>) -> Void){
        
        guard let url = URL(string: "\(Constant.baseUrl)/3/movie/top_rated?api_key=\(Constant.API_KEY)&language=en-US&page=1") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)){ data,  _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let  results = try JSONDecoder().decode(TrendingMoviesResponse.self, from: data)
                completion(.success(results.results))

                print(results)
                //                let results = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
                //                print(results)
                //            }
            }
            catch {
                print(error.localizedDescription)
                completion(.failure(error))
            }
            
            
        }
        task.resume()

    }
}
