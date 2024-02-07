//
//  MyFriends.swift
//  NavigationApp
//
//  Created by Mer Owens on 01/24/24.
//

import SwiftUI

struct Friends: Identifiable {
    var name: String
    var face: Image
    var isFavorite: Bool
    let id = UUID()
    
    static func myFriends() -> [Friends] {
        return[Friends(name: "Nana", face: Image("nana")
            , isFavorite: true),
               Friends(name: "Russer", face: Image("russer")
                   , isFavorite: true),
               Friends(name: "Mr Wooka", face: Image("wooka")
                       , isFavorite: false)
        ]
    }
}

struct FriendRow: View {
    let friend: Friends
    
    var body: some View {
        HStack {
            friend.face
                .resizable()
                .frame(width: 150, height:150)
                .cornerRadius(20)
            Text(friend.name)
            Spacer()
            Image(systemName: friend.isFavorite ? "heart.fill" : "heart")
        }
    }
}

struct MyFriends: View {
    @State private var monasFriends = Friends.myFriends()
    var body: some View {
        List {
            Section {
                ForEach (monasFriends) {
                    friend in FriendRow(friend: friend)
                }
            }
        }
        .navigationBarTitle("Mona's Friends")
    }
}

struct MyFriends_Previews: PreviewProvider {
    static var previews: some View {
        MyFriends()
    }
}
