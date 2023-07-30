//
//  RecipientDataModel.swift
//  Face2Face

import Foundation

struct ParticipantStructure: Identifiable {
    var id = UUID()
    var participantImage: String
    var participantName: String
    var participantRole: String
    var roleIcon: String
    var muted: String
}

let ParticipantData = [
    ParticipantStructure(participantImage: "host1", participantName: "Ava Boyd", participantRole: "Host", roleIcon: "speakerIcon", muted: ""),
    ParticipantStructure(participantImage: "host2", participantName: "Dustin W.", participantRole: "Co-host", roleIcon: "speakerIcon", muted: ""),
    ParticipantStructure(participantImage: "speaker1", participantName: "Frank B.", participantRole: "Co-host", roleIcon: "speakerIcon", muted: ""),
    ParticipantStructure(participantImage: "listener1", participantName: "Yaa", participantRole: "Listener", roleIcon: "listenerIcon", muted: "mic.slash.circle.fill"),
    ParticipantStructure(participantImage: "listener2", participantName: "Kwasi", participantRole: "Listener", roleIcon: "listenerIcon", muted: "mic.slash.circle.fill"),
    ParticipantStructure(participantImage: "listener3", participantName: "Gyamfi", participantRole: "Listener", roleIcon: "listenerIcon", muted: "mic.slash.circle.fill"),
    ParticipantStructure(participantImage: "listener4", participantName: "Ama", participantRole: "Listener", roleIcon: "listenerIcon", muted: "mic.slash.circle.fill"),
    ParticipantStructure(participantImage: "listener5", participantName: "Faith", participantRole: "Listener", roleIcon: "listenerIcon", muted: "mic.slash.circle.fill"),
    ParticipantStructure(participantImage: "speaker1", participantName: "Gemma", participantRole: "Listener", roleIcon: "listenerIcon", muted: "mic.slash.circle.fill"),
    ParticipantStructure(participantImage: "speaker2", participantName: "Jeffery", participantRole: "Listener", roleIcon: "listenerIcon", muted: "mic.slash.circle.fill"),
    ParticipantStructure(participantImage: "listener1", participantName: "Pentanen", participantRole: "Listener", roleIcon: "listenerIcon", muted: "mic.slash.circle.fill"),
    
]
