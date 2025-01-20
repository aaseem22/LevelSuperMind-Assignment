//
//  TrendingView.swift
//  LevelSuperMind
//
//  Created by Aaseem Mhaskar on 19/01/25.
//

import SwiftUI

struct TrendingView: View {
    let cards = [
        MusicCardData(title: "Connect Mind + Body", songs: "9 mins", xp: "• 10 XP"),
        MusicCardData(title: "Alpha Waves", songs: "10 mins", xp: "• 10 XP"),
        MusicCardData(title: "Binatural Beats", songs: "11 mins", xp: "• 10 XP"),
        MusicCardData(title: "Focus Temple", songs: "14 mins", xp: "• 10 XP")
    ]
    var body: some View {
        
        
        VStack{
            
            Text("Trending")
                .foregroundStyle(.white)
                .padding(8)
                .background(.purple)
                .frame(height: 40)
                .padding(.top,40)
                .frame(maxWidth: .infinity,alignment: .leading)
            
            
            TrendingCard()
            
            ScrollView {
                VStack {
                    ForEach(cards.indices, id: \.self) { index in
                        PodcastCard(card: cards[index])
                    }
                }
                .padding(.horizontal)
            }
            
        }
        .background{
            RoundedRectangle(cornerRadius: 25)
                .foregroundStyle(.white.opacity(0.1))
        }
        
    }
}

struct TrendingCard: View {
    var body: some View {
        HStack{
            Image("staticSquareThumbnailIcon")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 75,height: 75)
                .cornerRadius(12)
            
            VStack{
                Text("For Focus")
                    .font(.title2)
                    .foregroundStyle(.white)
                    .frame(maxWidth:.infinity,alignment: .leading)
                HStack{
                    Text("65 songs")
                        .font(.subheadline)
                        .foregroundStyle(.white)
                    
                    
                    Text("• 270 xp")
                        .font(.subheadline)
                        .foregroundStyle(.white)
                    
                }
                .frame(maxWidth:.infinity,alignment: .leading)
            }
            //TODO:- Add play button
            Image("play_circle")
                .resizable()
                .renderingMode(.template)
                .aspectRatio(contentMode: .fit)
                .frame(width: 60,height: 60)
                .foregroundColor(.teal)
        }
        .padding()
    }
}


struct PodcastCard: View {
    @State private var isLiked = false
    let card: MusicCardData
    var body: some View {
        HStack{
            Image("staticSquareThumbnailIcon")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 65,height: 65)
                .cornerRadius(12)
            VStack{
                Text(card.title)
                    .font(.title3)
                    .foregroundStyle(.white)
                    .frame(maxWidth:.infinity,alignment: .leading)
                HStack{
                    Text(card.songs)
                        .font(.subheadline)
                        .foregroundStyle(.white)
                    
                    Text(card.xp)
                        .font(.subheadline)
                        .foregroundStyle(.white)
                }
                .frame(maxWidth:.infinity,alignment: .leading)
            }
            Button(action: {
                isLiked.toggle()
            }) {
                Image(isLiked ? "favoriteSelected" : "favorite")
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 35, height: 35)
                    .foregroundColor(isLiked ? .red : .teal)
            }
        }
        .padding()
    }
}

#Preview {
    TrendingView()
}
