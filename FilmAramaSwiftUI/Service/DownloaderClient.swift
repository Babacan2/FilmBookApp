//
//  DownloaderClient.swift
//  FilmAramaSwiftUI
//
//  Created by Enes Babacan on 15.08.2024.
//

import Foundation

class DownloaderClient {
    
    
    func filmleriIndir(search: String, completion: @escaping (Result<[Film]?,DownloaderError>) -> Void) {
        
        let apikey = "2c52b383"
        
        guard let url = URL(string: "http://www.omdbapi.com/?s=\(search)&apikey=\(apikey)") else {
            return completion(.failure(.yanlisURL))
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return completion(.failure(.veriGelmedi))
            }
            
            guard let filmCevabi = try? JSONDecoder().decode(GelenFilmler.self, from: data) else {
                return completion(.failure(.veriIslenemedi))
            }
            
            completion(.success(filmCevabi.filmler))
            
        }.resume()
        
    }
    
    
    func filmDetayIndir(imdbId : String, completion : @escaping (Result<FilmDetay,DownloaderError>) -> Void ) {
        
        let apikey = "2c52b383"
        
        guard let url = URL(string: "http://www.omdbapi.com/?i=\(imdbId)&apikey=\(apikey)") else {
            return completion(.failure(.yanlisURL))
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return completion(.failure(.veriGelmedi))
            }
            
            guard let gelenFilmDetay = try? JSONDecoder().decode(FilmDetay.self, from: data) else {
                return completion(.failure(.veriIslenemedi))
            }
            
            completion(.success(gelenFilmDetay))
            
            
        }.resume()
    }
    
    
    
}

enum DownloaderError : Error {
    case yanlisURL
    case veriGelmedi
    case veriIslenemedi
}
