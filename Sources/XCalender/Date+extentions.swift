

//  Created by Damodar, Namala
//  Copyright © 2020 Damodar, Namala. All rights reserved.
//

import Foundation

public extension Date {
    var year: Int {
        Calendar.current.component(.year, from: self)
    }
    
    var month: Int {
        Calendar.current.component(.month, from: self)
    }
   
    @available(iOS 10.0, *)
    var daysCount: Int? {
        guard let interval = Calendar.current.dateInterval(of: .month, for: self) else {return 0}
        return Calendar.current.dateComponents([.day], from: interval.start, to: interval.end).day
    }
}

public extension Date {
    func setDateFormatter(_ string: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = string
        let string:String  = dateFormatter.string(from: self)
        return dateFormatter.date(from: string)!
    }
    
    var datesInMonth: [Date] {
        let month = self.month
        let year = self.year
        return Calendar.current.range(of: .day, in: .month, for: self)!.map {
            DateComponents(calendar: .current, year: year, month: month, day: $0, hour: 12).date!
        }
    }
    
    func string(with formate: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = formate
        return formatter.string(from:self)
    }
    
    func month(by value: Int) -> Date? {
        return Calendar.current.date(byAdding: .month, value: value, to: self)
    }
}
