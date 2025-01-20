//
//  MusicCard.swift
//  LevelSuperMind
//
//  Created by Aaseem Mhaskar on 19/01/25.
//

import SwiftUI

struct MusicCard: View {
    let card: MusicCardData
    
    var body: some View {
        VStack {
            Image("staticSquareThumbnailIcon")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150,height: 160)
                .padding(2)
                .background(.viewbutton)
                .cornerRadius(16, corners: [.topLeft,.topRight])
            
                Text("Music")
                    .font(.subheadline)
                    .foregroundStyle(.teal)
                    .frame(maxWidth:.infinity,alignment: .leading)
                    
                Text(card.title)
                    .font(.title2)
                    .foregroundStyle(.white)
                    .frame(maxWidth:.infinity,alignment: .leading)
                
                HStack{
                    Text("\(card.songs) songs")
                        .font(.subheadline)
                        .foregroundStyle(.white)
                    
                    Text("• \(card.xp) XP")
                        .font(.subheadline)
                        .foregroundStyle(.white)
                }
                .frame(maxWidth:.infinity,alignment: .leading)
            
        }
        .frame(width: 150)
        .padding()
        
        .multilineTextAlignment(.center)
       
   
        
        
    }
}

#Preview {
    MusicCard(card: .example)
}
