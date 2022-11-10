//
//  ContentView.swift
//  PinToBottomDemo
//
//  Created by XING ZHAO on 2022-11-10.
//

import SwiftUI
struct Message: Identifiable {
    var text: String
    var id: UUID = UUID()
}

struct ContentView: View {
    @State private var messages: [Message] = []
    @State private var newMessageText = ""
    
    var body: some View {
        NavigationStack {
            List(messages) { message in
                Text(message.text)
            }
            .safeAreaInset(edge: .bottom) {
                TextField("New Message", text: $newMessageText)
                    .padding()
                    .textFieldStyle(.roundedBorder)
                    .background(.ultraThinMaterial)
                    .onSubmit {
                        if !newMessageText.isEmpty {
                            messages.append(Message(text: newMessageText))
                            newMessageText = ""
                        }
                    }
            }
            .listStyle(.plain)
            .navigationTitle("My messages")
            .navigationBarTitleDisplayMode(.inline)
        }
        .onAppear {
            for i in 1...21 {
                messages.append(Message(text: "Message \(i)"))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
