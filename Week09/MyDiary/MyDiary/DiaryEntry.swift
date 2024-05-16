//
//  DiaryEntry.swift
//  MyDiary
//
//  Created by Mer Owens on 5/8/24.
//
import Foundation
import SwiftUI

struct DiaryEntry: Identifiable, Codable {
    var id = UUID()
    var date: Date
    var text: String?
    var imageData: Data?

    var image: UIImage? {
        get {
            if let imageData = imageData {
                return UIImage(data: imageData)
            }
            return nil
        }
        set {
            imageData = newValue?.jpegData(compressionQuality: 1.0)
        }
    }

    init(date: Date, text: String?, image: UIImage?) {
        self.date = date
        self.text = text
        self.image = image
    }

    private enum CodingKeys: String, CodingKey {
        case id, date, text, imageData
    }
}
