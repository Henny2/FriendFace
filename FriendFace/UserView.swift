//
//  UserView.swift
//  FriendFace
//
//  Created by Henrieke Baunack on 12/24/23.
//

import SwiftUI

struct UserView: View {
    let user: User
    var body: some View {
        VStack (alignment: .center){
            Text(user.name).font(.largeTitle).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).padding(.top)
            Text(user.isActive ? "online" : "offline").fontDesign(.monospaced)
            Text(user.about).italic().padding()
            VStack(alignment: .center) {
                Text("Friends:").font(.headline)
                ForEach(user.friends, id: \.id){ friend in
                    Text(friend.name)
                }
            }
//            .frame(maxWidth: .infinity, alignment: .leading)
//            .padding()
            Spacer()
        }
    }
}

#Preview {
    NavigationStack{
        UserView(user: User(id: "1", isActive: true, name: "Henny", age: 27, company: "KForce", email: "some@email.com", address: "Neverland", about: "This is me! Don't ask questions.", registered: Date.now, tags: ["active", "new"], friends: [Friend(id: "2", name: "Amy")]))
    }
}
