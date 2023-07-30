//
//  ListeningView.swift
//  VoiceDorm

import SwiftUI

struct ListeningView: View {
    @State private var animatedValue = 0
    var listeningParticipants: [ParticipantStructure] = []
    let items = Array(1...11)
    let columns: [GridItem] = [
        GridItem(.flexible(minimum: 100, maximum: 200)),
        GridItem(.flexible(minimum: 100, maximum: 200)),
        GridItem(.flexible(minimum: 100, maximum: 200)),
        GridItem(.flexible(minimum: 100, maximum: 200))
    ]
    
    @State private var scaleDisAppear = false
    @State private var move = false
    
    
    var body: some View {
        NavigationStack {
            HStack {
                Image(systemName: "person.2.fill")
                    .symbolEffect(
                        .bounce.down.byLayer,
                        options: .repeating.speed(0.1),
                        value: animatedValue)
                    .onAppear {
                        animatedValue = 1
                    }
                Text("11 participants")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(listeningParticipants) { guest in
                    VStack {
                        ZStack(alignment: .bottomTrailing) {
                            Image(guest.participantImage)
                                .resizable()
                                .frame(width: 64, height: 64)
                                .clipShape(Circle())
                            
                            Image(systemName: guest.muted)
                                .symbolRenderingMode(.multicolor)
                        }
                        Text(guest.participantName)
                            .font(.caption)
                            .bold()
                        
                        HStack {
                            Image(guest.roleIcon)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 16, height: 16)
                            Text(guest.participantRole)
                                .font(.caption2)
                                .foregroundStyle(.secondary)
                        }
                    }
                    .padding()
                }
            }
            .overlay(
                ZStack{
                    HeartReactionView()
                        .opacity(move ? 0 : 1)
                        .scaleEffect(move ? 0 : 1)
                        .animation(.easeOut.delay(4), value: move)
                        .scaleEffect(scaleDisAppear ? 1 : 0)
                        .scaleEffect(move ? 0.4 : 1)
                        .offset(x: move ? 24 : 0, y: move ? -24 : 0)
                        .offset(x: -105, y: -22)
                        .onAppear{
                            withAnimation(.bouncy.delay(2)) {
                                scaleDisAppear.toggle()
                            }
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
                                withAnimation(.bouncy) {
                                    move.toggle()
                                }
                            }
                        }
                    
                    HandAndSparklesView()
                        .offset(x: -52, y: 153)
                    
                    IsTalkingView()
                        .opacity(0.9)
                        .blendMode(.plusLighter)
                        .blur(radius: 2)
                        .offset(x: -318, y: -178)
                }
            )
            .padding(.bottom, 4)
            .navigationTitle("SwiftUI Heads")
            .toolbar {
                ToolbarItem(placement: .principal) {
                    VStack {
                        Text("Guests")
                            .bold()
                    }
                }
            }
        }
    }
}


#Preview {
    ListeningView(listeningParticipants: ParticipantData)
}
