//
//  PlaylistView.swift
//  AaseemsAssignment
//
//  Created by Salman Mhaskar on 20/01/25.
//

import SwiftUI

struct PlaylistView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var Data = [
        MusicListCardData(
            title: "Hot Ice Tea",duration: "15 mins",xp: "10 XP",category: "Music",imageName: "staticSquareThumbnailIcon"
        ),
        MusicListCardData(
            title: "Hot Ice Tea",duration: "15 mins",xp: "10 XP",category: "Music",imageName: "staticSquareThumbnailIcon"
        ),
        MusicListCardData(
            title: "Hot Ice Tea",duration: "15 mins",xp: "10 XP",category: "Music",imageName: "staticSquareThumbnailIcon"
        ),
        MusicListCardData(
            title: "Hot Ice Tea",duration: "15 mins",xp: "10 XP",category: "Music",imageName: "staticSquareThumbnailIcon"
        ),
        MusicListCardData(
            title: "Hot Ice Tea",duration: "15 mins",xp: "10 XP",category: "Music",imageName: "staticSquareThumbnailIcon"
        ),
    ]
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color(.background).ignoresSafeArea()
                
                Image("topBannerImage")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxHeight: .infinity, alignment: .top)
                    .ignoresSafeArea()
                
                VStack{
                    TopBar()
                    
                    VStack{
                        Image("Group 48098990")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                            .frame(maxWidth: .infinity, alignment:.trailing)
                            .padding()
                        
                        ScrollView(.vertical){
                            ForEach(Data, id:\.self){ item in
                                NavigationLink(destination:AudioPlaybackView( audioName: "Connect Body + Mind")){
                                    MusicListCardView(data: item)
                                }
                            }
                        }
                    }
                    Spacer()
                }
            }
            .navigationBarBackButtonHidden()
        }
    }
    @ViewBuilder
    private func TopBar() -> some View{
        HStack{
            Image(systemName: "arrowshape.backward.fill")
                .foregroundColor(.white)
                .padding(.trailing,12)
                .onTapGesture {
                    dismiss()
                }
            
            Text("Lofi Beats")
                .font(.title2)
                .frame(maxWidth:.infinity,alignment: .leading)
                .foregroundStyle(.white)
            Spacer()
            Image("topFavoriteIcon")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.white)
                .frame(width: 34,height: 34)
                .padding(.trailing,8)
            Image("topDownloadIcon")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.white)
                .frame(width: 34,height: 34)
            
        }
        .padding()
    }
}

#Preview {
    PlaylistView()
}
