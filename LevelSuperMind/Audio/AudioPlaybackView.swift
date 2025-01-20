
import SwiftUI

struct AudioPlaybackView: View {
    
    @State private var isPlaying = false
    @State private var isFavorite = true
    
    @StateObject var audioPlayer = AudioController()
    @Environment(\.dismiss) var dismiss
    
    var audioName: String
    
    
    var body: some View {
        ZStack {
            Color(.background).ignoresSafeArea()
            
            Image("musicPlayerBackgroundImage")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(25, corners: [.bottomLeft,.bottomRight])
                .frame(maxHeight: .infinity, alignment: .top)
                .ignoresSafeArea()
                .overlay(alignment: .topLeading){
                    Image(systemName: "arrowshape.backward.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 25, height: 25)
                        .foregroundStyle(.white)
                        .padding()
                        .onTapGesture {
                            dismiss()
                        }
                }
           
            VStack {
                    
                    Spacer()
                
                InformationBar()
                
                HStack {
                    Text(audioPlayer.elapsedTime)
                        .font(.caption)
                        .foregroundColor(.gray)
                    
                    Spacer()
                    
                    Text(audioPlayer.remainingTime)
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                
                // Progress bar with a slider
                Slider(
                    value: $audioPlayer.progress,
                    in: 0...1,
                    onEditingChanged: { editing in
                        audioPlayer.seekToProgress(editing: editing)
                    }
                )
                .tint(.purple)
                
                AudioControls()
                    .padding(.bottom)
         
            }
            .padding()
            .onAppear {
                audioPlayer.setupAudio() // Setup the audio player
            }
            .onDisappear {
                audioPlayer.stopAudio() // Clean up when the view disappears
            }
        }
        .navigationBarBackButtonHidden()
    }
    
    @ViewBuilder
    func InformationBar() -> some View {
        HStack {
            ScrollView(.horizontal){
                Text(audioName)
                    .font(.title2)
                    .foregroundStyle(.white)
                    .bold()
                
            }.frame(width: 240)
                .scrollIndicators(.hidden)
                
            
            Spacer()
            
            Image(systemName: "square.and.arrow.up")
                .resizable()
                .foregroundStyle(.white)
                .aspectRatio(contentMode: .fit)
                .frame(width: 25, height: 25)
                .padding(.trailing, 2)
            
            Image("download")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundStyle(.white)
                .frame(width: 25, height: 25)
                .padding(.trailing, 2)
            
            Image(isFavorite ? "favoriteSelected" : "favorite")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundStyle(.white)
                .frame(width: 25, height: 25)
                .padding(.trailing, 2)
                .onTapGesture {
                    isFavorite.toggle()
                }
        }
        .padding()
    }
    
    // MARK: Audio Controls
    @ViewBuilder
    func AudioControls() -> some View {
        HStack(spacing: 20) {
            Spacer()
            Image(systemName: "backward.end.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 20, height: 20)
                .foregroundStyle(.white)
            
            Image(systemName: isPlaying ? "pause.circle.fill" : "play.circle.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
                .onTapGesture {
                    isPlaying.toggle()
                    if isPlaying {
                        audioPlayer.play()
                    } else {
                        audioPlayer.pause()
                    }
                }
                .foregroundStyle(.white)
            
            Image(systemName: "forward.end.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 20, height: 20)
                .foregroundStyle(.white)
            
            Image(systemName: "repeat")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 20, height: 20)
                .foregroundStyle(.white)
            Spacer()
        }
    }
}

#Preview {
    AudioPlaybackView(audioName: "Connect Mind + Body")
}
