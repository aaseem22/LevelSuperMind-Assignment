//
//  MusicListCard.swift
//  LevelSuperMind
//
//  Created by Aaseem Mhaskar on 20/01/25.
//

import SwiftUI

struct MusicListCardView: View {
    
    @State private var isLiked = false
    var data: MusicListCardData

    var body: some View {
        HStack(spacing: 16) {
            
            Image(data.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100)
                .background(Color.green)
                .cornerRadius(12, corners: [.topLeft,.bottomLeft])
                

            VStack(alignment: .leading, spacing: 8) {
                Text(data.title)
                    .font(.headline)
                    .foregroundColor(.white)
                Text("\(data.duration) • \(data.xp)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Text(data.category)
                    .font(.footnote)
                    .foregroundColor(.teal)
            }

            Spacer()
            
            
            VStack{
                HStack(spacing: 16) {
                    Button(action: {
                    }) {
                        Image(systemName: "arrow.down.circle")
                            .font(.title2)
                            .foregroundColor(.white)
                    }
                    Button(action: {
                        isLiked.toggle()
                    }) {
                        Image(systemName: isLiked ? "heart.fill" : "heart")
                            .font(.title2)
                            .foregroundColor(isLiked ? .red : .white)
                    }
                }
                .padding()
                
                Button(action: {
                }) {
                    Image(systemName: "play.circle")
                        .font(.title2)
                        .foregroundColor(.purple)
                }
                .padding(.bottom)
            }
            
        }
        .background(.white.opacity(0.1))
        .cornerRadius(12)
        .padding()
    }
}


#Preview {
    MusicListCardView(data: MusicListCardData(
        title: "Hot Ice Tea",
                      duration: "15 mins",
                      xp: "10 XP",
                      category: "Music",
                      imageName: "staticSquareThumbnailIcon"
    ))
}
