//
//  ImageDownloaderClient.swift
//  FilmAramaSwiftUI
//
//  Created by Enes Babacan on 16.08.2024.
//

import Foundation

class ImageDownloaderClient : ObservableObject {
    
    @Published var indirilenGorsel : Data?
    
    
    func gorselIndir(url:String) {
        
        guard let imageURL = URL(string: url) else {
            return
        }
        
        URLSession.shared.dataTask(with: imageURL) { (data, response, error) in
            guard let data = data, error == nil else {
                return
            }
            
            DispatchQueue.main.async {
                self.indirilenGorsel = data
            }
            
            
            
        }.resume()
    }
    
    
}
