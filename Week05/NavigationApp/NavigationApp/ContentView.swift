//
//  ContentView.swift
//  NavigationApp
//
//  Created by Mer Owens on 01/24/24.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    NavigationView {
        List {
            NavigationLink(destination: AboutMe()) {
                Text("About Mona")
            }
            NavigationLink(destination: MyFriends()) {
                Text("Mona's Friends")
            }
        }
        .navigationBarTitle("Mona's Profile", displayMode: .inline)
    }
  }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
