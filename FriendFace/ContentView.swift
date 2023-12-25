//
//  ContentView.swift
//  FriendFace
//
//  Created by Henrieke Baunack on 12/23/23.
//

// how to use URLSession and Codable to download and encode data from the internet
//https://www.hackingwithswift.com/books/ios-swiftui/sending-and-receiving-codable-data-with-urlsession-and-swiftui

import SwiftUI

struct ContentView: View {

    @State private var users = [User]()
    var numbers = [1,2,3,4]
    var body: some View {
        NavigationStack {
            VStack {
                List(users, id: \.id) { user in
                    VStack{
                        NavigationLink(user.name){
                            Color.red
                        }
                    }
                }
                Text(String(users.count))
            }
        }
        .padding()
        .task {
            await loadData()
        }
    }
    
    func loadData () async {
        if(users.count > 0 ) { return }
        // step 1: creating the URL we want to read from
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid URL")
            return
        }
        
        // step2: fetching the data from the URL
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            print(data)
            
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601 // making sure the date properties are decoded correctly
                let decodedData = try decoder.decode([User].self, from: data)
//                print(decodedData)
                users = decodedData
                print(users[0].friends)
            } catch {
                print("There was an issue decoding the data")
            }
        } catch {
            print("There was an error fetching data from the URL")
        }
        
    }
}

#Preview {
    ContentView()
}
