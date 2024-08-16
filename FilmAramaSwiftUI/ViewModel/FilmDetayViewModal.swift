//
//  FilmDetayViewModal.swift
//  FilmAramaSwiftUI
//
//  Created by Enes Babacan on 16.08.2024.
//

import Foundation

class FilmDetayViewModal : ObservableObject {
    
    @Published var filmDetayi : FilmDetaylariViewModal?
    
    let downloaderClient = DownloaderClient()
    
    func filmDetayIndi(imdbId: String) {
        
        downloaderClient.filmDetayIndir(imdbId: imdbId) { sonuc in
            switch sonuc {
            case .failure(let hata):
                print("Hata")
                
            case .success(let filmDetay):
                self.filmDetayi = FilmDetaylariViewModal(detay: filmDetay)
            }
            
        }
    }
    
    
    
    struct FilmDetaylariViewModal {
        let detay : FilmDetay
        
        var title : String {
            detay.title
        }
        
        var poster : String {
            detay.poster
        }
        
        var year : String {
            detay.year
        }
        
        var imdbId : String {
            detay.imdbId
        }
        
        var director : String {
            detay.director
        }
        
        var writer : String {
            detay.writer
        }
        
        var plot : String {
            detay.plot
        }
        
        var actors : String {
            detay.actors
        }
    }
    
}
