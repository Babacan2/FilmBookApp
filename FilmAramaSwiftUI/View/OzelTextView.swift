//
//  OzelTextView.swift
//  FilmAramaSwiftUI
//
//  Created by Enes Babacan on 16.08.2024.
//

import SwiftUI

struct OzelTextView: View {
    
    @State var text : String
    var body: some View {
       
            
        Text("Elegant Text")
            .font(.system(size: 24, weight: .semibold, design: .default))
            .font(.system(size: 24, weight: .semibold, design: .default))

            
        
    }
}

#Preview {
    OzelTextView(text: "Enes Babacan")
}
