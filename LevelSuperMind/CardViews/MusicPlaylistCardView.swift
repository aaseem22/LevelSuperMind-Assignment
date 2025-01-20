import SwiftUI

struct MusicPlaylistCardView: View {
    var playlist: PlaylistData
    var body: some View {
        VStack{
            Image("staticSquareThumbnailIcon")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 145, height: 140)
                .cornerRadius(24, corners: [.topLeft,.topRight])
                .padding(.bottom, -4)
            
            VStack{
                Text(playlist.name)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.subheadline)
                    .bold()
                    .foregroundStyle(.white)
                    .padding(.bottom,10)
                
                HStack{
                    Text("\(playlist.noOfSongs) songs")
                        .foregroundStyle(.white)
                        .bold()
                        .font(.caption)
                    
                    Text("• \(playlist.XP) XP")
                        .foregroundStyle(.white)
                        .bold()
                        .font(.caption)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            .padding()
            .background{
                Color(.teal)
            }
            .cornerRadius(25, corners: [.bottomLeft,.bottomRight])
        }
        .padding(2)
        .background(.white.opacity(0.3))
        .frame(width: 150)
        .cornerRadius(24, corners: [.allCorners])
    }
}

struct PlaylistScrollView: View {
    let playlists = [
        PlaylistData(name: "Study", noOfSongs: "23", XP: "78"),
        PlaylistData(name: "Game", noOfSongs: "23", XP: "78"),
        PlaylistData(name: "Relax", noOfSongs: "23", XP: "78"),
        PlaylistData(name: "Chill", noOfSongs: "23", XP: "78"),
        PlaylistData(name: "Focus", noOfSongs: "23", XP: "78"),
        PlaylistData(name: "Fun", noOfSongs: "23", XP: "78")
    ]
    var body: some View {
        
        
        VStack{
            Text("Music Playlist")
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundStyle(.white)
                .font(.title3)
                .padding(.horizontal)
                .padding()
            
            ScrollView(.horizontal){
                HStack(spacing:10){
                    ForEach(playlists,id:\.self){ playlist in
                        
                        MusicPlaylistCardView(playlist: playlist)
                        
                    }
                } .padding(.horizontal)
            }
            .padding(.horizontal)
            .scrollContentBackground(.hidden)
            .scrollIndicators(.hidden)
        }
        
    }
}

#Preview {
    PlaylistScrollView()
}
