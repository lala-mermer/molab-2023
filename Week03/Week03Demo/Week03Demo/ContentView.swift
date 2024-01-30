//
//  ContentView.swift
//  Week03Demo
//
//  Created by Mer Owens on 1/22/24.
//

import SwiftUI

struct ContentView: View {
    @State private var rectangles: [CircleData] = []

    var body: some View {
        VStack {
            ImageGeneratorView(rectangles: $rectangles)
                .frame(width: 220, height: 220)
                .border(Color.black, width: 3)
            //can't add corner radius
            Button(action: generateRandomImage) {
                Text("Generate Random Circles")
                    .bold()
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(Color.white)
                    .cornerRadius(10)
            }
        }
    }
    
    func generateRandomImage() {
        rectangles = (0..<4).map { _ in
            CircleData(x: CGFloat.random(in: 30...180),
                           y: CGFloat.random(in: 30...180),
                           width: CGFloat.random(in: 10...60),
                           height: CGFloat.random(in: 10...60),
                           color: Color.random())
        }
    }
}

struct ImageGeneratorView: View {
    @Binding var rectangles: [CircleData]
    
    var body: some View {
        ZStack { //another SwiftUI container view that arranges its child views in a back-to-front stack
            ForEach(rectangles, id: \.self.id) { rectangle in //iterate over the rectangles array and create a view for each RectangleData element. The id parameter is set to \.self.id, ensuring that each rectangle is uniquely identifiable.
                Circle()
                    .frame(width: rectangle.width, height: rectangle.height)
                    .position(x: rectangle.x, y: rectangle.y)
                    .foregroundColor(rectangle.color)
            }
        }
    }
}

struct CircleData: Identifiable, Hashable {
    var id = UUID()
    var x: CGFloat
    var y: CGFloat
    var width: CGFloat
    var height: CGFloat
    var color: Color
}

extension Color {
    static func random() -> Color {
        let red = Double.random(in: 0...1)
        let green = Double.random(in: 0...1)
        let blue = Double.random(in: 0...1)
        return Color(red: red, green: green, blue: blue)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
