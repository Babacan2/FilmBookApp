//
//  FilmViewModal.swift
//  FilmAramaSwiftUI
//
//  Created by Enes Babacan on 15.08.2024.
//

import Foundation
import SwiftUI

class FilmListeViewModal : ObservableObject {
    
    @Published var filmler = [FilmViewModal]()
    
    let downloaderClient = DownloaderClient()
    
    func filmAramasiYap(filmSearch:String) {
        downloaderClient.filmleriIndir(search: filmSearch) { (sonuc) in
            switch sonuc{
            case .failure(let hata) :
                print(hata)
                
            case .success(let filmDizisi):
                if let filmDizisi = filmDizisi {
                    DispatchQueue.main.async {
                        self.filmler = filmDizisi.map(FilmViewModal.init)
                    }
                    
                }
            }
            
        }
    }
    
}

struct FilmViewModal {
    
    let film : Film
    
    var title : String {
        film.title
    }
    var poster : String {
        film.poster
    }
    var year : String {
        film.year
    }
    var imdbId : String {
        film.imdbId
    }
    
}
