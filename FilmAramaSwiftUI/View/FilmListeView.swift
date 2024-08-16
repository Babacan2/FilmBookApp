//
//  ContentView.swift
//  FilmAramaSwiftUI
//
//  Created by Enes Babacan on 15.08.2024.
//

import SwiftUI

struct FilmListeView: View {
    
    @ObservedObject var filmListeViewModal : FilmListeViewModal
    
    @State var aranacakFilm = ""
    
    
    init() {
        self.filmListeViewModal = FilmListeViewModal()
        self.filmListeViewModal.filmAramasiYap(filmSearch: "Titanic")
    }
    
    
    var body: some View {
        NavigationView {
            
            VStack {
                
                TextField("Aranacak Film", text: $aranacakFilm) {
                    self.filmListeViewModal.filmAramasiYap(filmSearch: aranacakFilm)
                }.padding().textFieldStyle(RoundedBorderTextFieldStyle())
                
                
                List(filmListeViewModal.filmler, id: \.imdbId) { film in
                    NavigationLink(
                        destination : DetayView(imdbId: film.imdbId),
                        label: {
                            
                            HStack() {
                                ozelImage(url: film.poster)
                                    .frame(width: 100,height: 140)
                                
                                
                                VStack(alignment: .leading) {
                                    
                                    Text(film.title)
                                        .font(.title3)
                                        .foregroundColor(.blue)
                                    
                                    Text(film.year)
                                        .foregroundColor(.orange)
                                }
                            }
                        })
                    
                }.navigationTitle("Filmler Kitabı")
            }
                        
        }
    }
}

#Preview {
    FilmListeView()
}
