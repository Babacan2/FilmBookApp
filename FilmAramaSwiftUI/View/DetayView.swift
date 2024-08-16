//
//  DetayView.swift
//  FilmAramaSwiftUI
//
//  Created by Enes Babacan on 16.08.2024.
//

import SwiftUI





struct DetayView: View {
    
    let imdbId : String
    @ObservedObject var filmDetayViewModal = FilmDetayViewModal()
    
    
    var body: some View {
        
        ZStack {
            
            Rectangle()
                .fill(Color.black)
                .frame(width: UIScreen.main.bounds.width * 1,height: UIScreen.main.bounds.height * UIScreen.main.bounds.height * 1)
                .cornerRadius(30)
                .shadow(radius: 20)
                
        
            VStack {
                
                ozelImage(url: filmDetayViewModal.filmDetayi?.poster ?? "titanic")
                    .frame(width: 250,height: 300)
                    .cornerRadius(10)
                    .border(Color.white, width: 3)
                    //.padding(.bottom, 50)
                
                
                
                    
                    Text(filmDetayViewModal.filmDetayi?.title ?? "Film Adı Göster")
                        .foregroundStyle(Color.white)
                        .bold()
                        .font(.system(size: 20, weight: .semibold, design: .default))
                        .frame(width: UIScreen.main.bounds.width * 0.85, height: 50,alignment: .leading)
                    
                    
                    Text(filmDetayViewModal.filmDetayi?.year ?? "Bilinmiyor")
                        .foregroundStyle(Color.white)
                        .bold()
                        .font(.system(size: 20, weight: .semibold, design: .default))
                        .frame(width: UIScreen.main.bounds.width * 0.85, height: 50,alignment: .leading)
                              
                    
                    /*Text(filmDetayViewModal.filmDetayi?.director ?? "Director")
                        .foregroundStyle(Color.white)
                        .bold()
                        .font(.system(size: 20, weight: .semibold, design: .default))
                        .padding()*/
                    
                    
                    /*Text(filmDetayViewModal.filmDetayi?.actors ?? "Actors")
                        .foregroundStyle(Color.white)
                        .bold()
                        .font(.system(size: 20, weight: .semibold, design: .default))*/
            
                
                Text(" -- Plot -- ")
                    /*.foregroundStyle(Color.white)
                    .bold()
                    .font(.title2)
                    .frame(width: 150,height: 30,alignment: .leading)
                    .underline()*/
                    
                    .font(.system(size: 30, weight: .bold, design: .default))
                                    .foregroundColor(.white)
                                    .overlay(
                                        LinearGradient(gradient: Gradient(colors: [.purple, .blue, .pink]), startPoint: .top, endPoint: .bottom)
                                            .mask(Text(" -- Plot -- ")
                                                    .font(.system(size: 30, weight: .bold, design: .default))
                                                 )
                                    )
                                    .shadow(color: .blue.opacity(0.7), radius: 5, x: 0, y: 3)
                
                
                Text(filmDetayViewModal.filmDetayi?.plot ?? "plot")
                    .font(.system(size: 20, weight: .semibold, design: .default))
                    .bold()
                    .padding(.top , 10)
                    .foregroundColor(Color.white)
                    .frame(width: UIScreen.main.bounds.width * 0.85)
                
                
            }.onAppear(perform: {
                self.filmDetayViewModal.filmDetayIndi(imdbId: imdbId)
            })
            
            
            
            
            
        }.padding()
        
    }
    
}

#Preview {
    DetayView(imdbId: "asd")
}
