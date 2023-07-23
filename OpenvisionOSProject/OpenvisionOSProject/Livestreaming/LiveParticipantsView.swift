//
//  LiveParticipantsView.swift
//  SwiftUIOpenVoipAnimations
//

import SwiftUI

struct LiveParticipantsView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                LiveConcertVideo()
                VStack {
                    HStack {
                        Spacer()
                        
                        List {
                            HStack {
                                Image("adwoa")
                                    .clipShape(Circle())
                                
                                VStack(alignment: .leading) {
                                    Text("Chiara Steinbeck")
                                        .font(.footnote)
                                        .fontWeight(.bold)
                                    Text("Hi")
                                        .font(.caption2)
                                        .foregroundStyle(.secondary)
                                }
                                
                                Spacer()
                                
                                Image(systemName: "hand.wave")
                            }
                            
                            HStack {
                                Image("kwadwo")
                                    .clipShape(Circle())
                                
                                VStack(alignment: .leading) {
                                    Text("Maren Septimus")
                                        .font(.footnote)
                                        .fontWeight(.bold)
                                    Text("listening")
                                        .font(.caption2)
                                        .foregroundStyle(.secondary)
                                }
                                
                                Spacer()
                                
                                Image(systemName: "mic.slash")
                                    .symbolRenderingMode(.multicolor)
                            }
                            
                            HStack {
                                Image("serwaa")
                                    .clipShape(Circle())
                                
                                VStack(alignment: .leading) {
                                    Text("Ama Serwaa")
                                        .font(.footnote)
                                        .fontWeight(.bold)
                                    Text("listening")
                                        .font(.caption2)
                                        .foregroundStyle(.secondary)
                                }
                                
                                Spacer()
                                
                                Image(systemName: "mic.slash")
                                    .symbolRenderingMode(.multicolor)
                            }
                            
                            HStack {
                                Image("afia")
                                    .clipShape(Circle())
                                
                                VStack(alignment: .leading) {
                                    Text("Yaa Abrafi")
                                        .font(.footnote)
                                        .fontWeight(.bold)
                                    Text("Wow, that is so cool")
                                        .font(.caption2)
                                        .foregroundStyle(.secondary)
                                }
                                
                                Spacer()
                                
                                Image(systemName: "figure.wave")
                                    .symbolRenderingMode(.multicolor)
                            }
                            
                        }
                        .listStyle(.insetGrouped)
                        //.scrollContentBackground(.hidden)
                        .frame(width: 360, height: 260)
                    }
                    
                    SoundIndicator()
                        .padding(.top)
                    
                    HStack(spacing: 28) {
                        Image(systemName: "phone.down.circle.fill")
                            .font(.system(size: 42))
                            .symbolRenderingMode(.multicolor)
                        Image(systemName: "video.circle.fill")
                            .font(.system(size: 42))
                            .symbolRenderingMode(.multicolor)
                        Spacer()
                        ReactionsWithKeyframes()
                    }
                }
                .padding(.horizontal)
            }
            .toolbar{
                ToolbarItemGroup(placement: .topBarLeading) {
                    Button {
                        
                    } label: {
                        Image(systemName: "chevron.left")
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Live Concert")
                            .foregroundStyle(.red)
                            .font(.caption)
                        HStack {
                            Image(systemName: "eyes.inverse")
                                .font(.caption2)
                            Text("2K+ participants")
                                .foregroundStyle(.secondary)
                                .font(.caption2)
                        }
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        //
                    } label: {
                        Image(systemName: "ellipsis")
                    }
                }
            }
        }
    }
}

#Preview {
    LiveParticipantsView()
}
