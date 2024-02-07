//
//  AboutMe.swift
//  NavigationApp
//
//  Created by Mer Owens on 01/24/24.
//

import SwiftUI

struct AboutMe: View {
    var body: some View {
        VStack{
            HStack{
                Image("mona")
                    .resizable()
                    .frame(width: 150, height: 150)
                    .cornerRadius(100)
                VStack(alignment:.leading) {
                    Text("MONA")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Text("What a wonderful girl!")
                    Text("mona@nyu.edu")
                }
            }
            Spacer()
        }
        .navigationBarTitle("About Me")
    }
}

struct AboutMe_Previews: PreviewProvider {
    static var previews: some View {
        AboutMe()
    }
}
