//
//  JournalEntry.swift
//  MyDiaryFinal
//
//  Created by Mer Owens on 5/22/24.
//

import SwiftUI

struct JournalEntry: Identifiable {
    let id = UUID()
    let date: Date
    var text: String?
    var image: Image?
}

