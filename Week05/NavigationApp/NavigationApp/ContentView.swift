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
                Text("About Me")
            }
            NavigationLink(destination: Projects()) {
                Text("My Projects")
            }
            NavigationLink(destination: SettingsRecreation()) {
                Text("Settings Recreation")
            }
        }
//    .navigationBarTitle("Drew's App")

      .navigationBarTitle("Mona's Profile", displayMode: .inline)
    }
  }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
