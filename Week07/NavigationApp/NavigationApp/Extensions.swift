//
//  Extensions.swift
//  NavigationApp
//
//  Created by Mer Owens on 01/24/24.
//  Copyright © 2024 itpstudent. All rights reserved.
//

import Foundation

extension Date
{
    func toString(dateFormat format: String ) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }

}
