//
//  CropViewControllerWrapper.swift
//  PhotoApp
//
//  Created by Mer Owens on 5/9/24.
//

import SwiftUI
import CropViewController

struct CropViewControllerWrapper: UIViewControllerRepresentable {
    var image: UIImage
    @Binding var croppedImage: UIImage?
    @Binding var isPresented: Bool

    class Coordinator: NSObject, CropViewControllerDelegate {
        let parent: CropViewControllerWrapper

        init(parent: CropViewControllerWrapper) {
            self.parent = parent
        }

        func cropViewController(_ cropViewController: CropViewController, didCropToImage image: UIImage, withRect cropRect: CGRect, angle: Int) {
            parent.croppedImage = image
            parent.isPresented = false
        }

        func cropViewController(_ cropViewController: CropViewController, didFinishCancelled cancelled: Bool) {
            parent.isPresented = false
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }

    func makeUIViewController(context: Context) -> CropViewController {
        let cropViewController = CropViewController(image: image)
        cropViewController.delegate = context.coordinator
        return cropViewController
    }

    func updateUIViewController(_ uiViewController: CropViewController, context: Context) {}
}
