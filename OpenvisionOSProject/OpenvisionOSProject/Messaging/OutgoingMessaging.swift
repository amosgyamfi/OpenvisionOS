
import SwiftUI
import UIKit

struct Message: Identifiable {
    let id = UUID()
    let content: String
    let isSender: Bool
    var isDelivered: Bool = false
}

struct OutgoingMessaging: View {
    @State private var messages: [Message] = []
    @State private var newMessage = ""
    @State private var showAlert = false
    @State private var messageCount = 2
    @State private var showingBubble = false
    
    var body: some View {
        NavigationStack {
            HStack {
                Color.clear
                VStack(spacing: 12) {
                    Color.clear
                    Spacer()
                    ForEach(messages) { message in
                        HStack {
                            Spacer()
                            VStack(alignment: .trailing, spacing: 2) {
                                Text(message.content)
                                    .foregroundColor(.white)
                                    .padding(10)
                                    .background(UnevenRoundedRectangle(cornerRadii: RectangleCornerRadii(topLeading: 20, bottomLeading: 20, topTrailing: 20)).fill(.blue))
                                    .phaseAnimator([false, true], trigger: messageCount) { messageBubble, scaleFromBottomTrailing in
                                        messageBubble
                                            .scaleEffect(scaleFromBottomTrailing ? 1.5 : 1, anchor: .bottomTrailing)
                                    } animation: { scaleFromBottomTrailing in
                                            .bouncy
                                    }
                                
                                Text(Date.now, style: .time)
                                    .font(.caption2)
                                    .foregroundStyle(.secondary)
                            }
                        }.padding(.horizontal, 16)
                    }
                    .listStyle(.plain)

                    .padding(.horizontal, 8)
                    
                    HStack {
                        Image(systemName: "paperclip")
                        Image(systemName: "bolt.fill")
                        
                        TextField("Send a message", text: $newMessage)
                            .padding(.horizontal, 8)
                            .textFieldStyle(.roundedBorder)
                        
                        Button {
                            resignFirstResponder()
                            sendMessage()
                            messageCount = 1
                            showingBubble = true
                            
                        } label: {
                            Image(systemName: "arrow.right.circle.fill")
                                .font(.title)
                                .disabled(newMessage.isEmpty)
                        }
                        .disabled(showAlert) // Disable the button if the alert is shown
                    }
                    .padding(.bottom, 32)
                    .padding(.horizontal, 24)
                    .blur(radius: showAlert ? 2 : 0)
                }
                .toolbar{
                    ToolbarItem(placement: .topBarLeading) {
                        Image(systemName: "chevron.left")
                            .blur(radius: showAlert ? 2 : 0)
                    }
                    
                    ToolbarItem(placement: .principal) {
                        VStack {
                            Text("Jeroen Leenarts")
                                .font(.subheadline)
                                .bold()
                                .blur(radius: showAlert ? 5 : 0)
                            Text("Last seen 52 minus ago")
                                .font(.caption2)
                                .foregroundStyle(.secondary)
                                .blur(radius: showAlert ? 1 : 0)
                        }
                    }
                    
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            resignFirstResponder()
                        } label: {
                            Image("ama")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 32, height: 32)
                                .clipShape(Circle())
                                .blur(radius: showAlert ? 15 : 0)
                        }
                        .buttonStyle(.plain)
                        
                    }
                }
                .padding(.top, 280)
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("Message Forbidden"),
                        message: Text("The message you entered is forbidden."),
                        dismissButton: .default(Text("OK"))
                    )
                    
                }
            }
        }
    }
    
    /// Resigns first responder and hides the keyboard.
    public func resignFirstResponder() {
        UIApplication.shared.sendAction(
            #selector(UIResponder.resignFirstResponder),
            to: nil,
            from: nil,
            for: nil
        )
    }
    
    func sendMessage() {
        guard !newMessage.isEmpty else {
            return
        }
        
        let forbiddenPhrases = [
            "Does anyone know a website that is tracking Elon Musk's private jet?",
            "Send me the Mastercard number",
            "Click this link to order visionPro for €99",
            "How do we kick him out of the race?"]
        
        if forbiddenPhrases.contains(newMessage) {
            // Show forbidden message alert
            withAnimation(.bouncy) {
                showAlert = true
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                showAlert = false
            }
            
            return
        }
        
        withAnimation(.bouncy) {
            messages.append(Message(content: newMessage, isSender: true))
        }
        
        withAnimation(.bouncy) {
            newMessage = ""
        }
    }
}

#Preview {
    OutgoingMessaging()
}
