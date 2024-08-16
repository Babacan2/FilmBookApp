//
//  ozelImage.swift
//  FilmAramaSwiftUI
//
//  Created by Enes Babacan on 16.08.2024.
//

import SwiftUI

struct ozelImage: View {
    
    let url : String
    @ObservedObject var imageDownloaderClient = ImageDownloaderClient()
    
    init(url:String) {
        self.url = url
        self.imageDownloaderClient.gorselIndir(url: self.url)
    }
    
    var body: some View {
        if let data = self.imageDownloaderClient.indirilenGorsel {
            return Image(uiImage: UIImage(data: data)!)
                .resizable()
            }
            else {
                return Image("placeholder1")
                    .resizable()
            }
    }
}

#Preview {
    ozelImage(url: "https://m.media-amazon.com/images/M/MV5BMjI2MzU2NzEzN15BMl5BanBnXkFtZTcwMzI5NTU3Nw@@._V1_SX300.jpg")
}
