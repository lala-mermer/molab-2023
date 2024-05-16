//
//  ContentView.swift
//  PhotoApp
//
//  Created by Mer Owens on 5/8/24.
//

import SwiftUI
import CropViewController

struct ContentView: View {
    @State private var selectedImage: UIImage?
    @State private var isImagePickerPresented = false
    @State private var isCropViewPresented = false

    var body: some View {
        VStack {
            if let selectedImage = selectedImage {
                Image(uiImage: selectedImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
            } else {
                Text("Select an Image")
                    .font(.title)
                    .padding()
            }

            Button(action: {
                isImagePickerPresented = true
            }) {
                Text("Pick Image")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .sheet(isPresented: $isImagePickerPresented) {
            ImagePicker(selectedImage: $selectedImage, isPresented: $isImagePickerPresented, isCropViewPresented: $isCropViewPresented)
        }
        .sheet(isPresented: $isCropViewPresented) {
            if let selectedImage = selectedImage {
                CropViewControllerWrapper(image: selectedImage, croppedImage: $selectedImage, isPresented: $isCropViewPresented)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
