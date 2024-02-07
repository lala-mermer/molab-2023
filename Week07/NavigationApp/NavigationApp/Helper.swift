//
//  Helper.swift
//  NavigationApp
//
//  Created by Mer Owens on 01/24/24.
//  Copyright © 2024 itpstudent. All rights reserved.
//

import Foundation


func getFileDate(for file: URL) -> Date {
    if let attributes = try? FileManager.default.attributesOfItem(atPath: file.path) as [FileAttributeKey: Any],
        let creationDate = attributes[FileAttributeKey.creationDate] as? Date {
        return creationDate
    } else {
        return Date()
    }
}
