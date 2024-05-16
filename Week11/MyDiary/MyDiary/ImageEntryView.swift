//
//  ImageEntryView.swift
//  MyDiary
//
//  Created by Mer Owens on 5/16/24.
//
import SwiftUI

struct ImageEntryView: View {
    @EnvironmentObject var diaryViewModel: DiaryViewModel
    @Binding var isPresented: Bool
    var date: Date

    @State private var image: UIImage?
    @State private var isImagePickerPresented = false

    var body: some View {
        NavigationView {
            VStack {
                if let image = image {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 300)
                        .padding()
                }

                Button(action: {
                    isImagePickerPresented = true
                }) {
                    Text("Select Image")
                        .padding()
                        .background(Color.pastelPurple)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                }
                .padding()

                Button(action: {
                    if let image = image {
                        diaryViewModel.addEntry(for: date, text: nil, image: image)
                        isPresented = false
                    }
                }) {
                    Text("Save")
                        .padding()
                        .background(Color.pastelGreen)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                }
                .padding()
            }
            .background(Color.pastelPink.edgesIgnoringSafeArea(.all))
            .navigationBarTitle("New Entry", displayMode: .inline)
            .navigationBarItems(leading: Button(action: {
                isPresented = false
            }) {
                Text("Cancel")
                    .foregroundColor(.pastelBlue)
            })
            .sheet(isPresented: $isImagePickerPresented) {
                ImagePicker(image: $image)
            }
        }
    }
}

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var image: UIImage?

    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ImagePicker

        init(parent: ImagePicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let uiImage = info[.originalImage] as? UIImage {
                parent.image = uiImage
            }

            parent.presentationMode.wrappedValue.dismiss()
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.presentationMode.wrappedValue.dismiss()
        }
    }

    @Environment(\.presentationMode) var presentationMode

    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
}
