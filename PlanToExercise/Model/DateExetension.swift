import Foundation

extension Date {
    var yearMonthDay: String {
       let dateFormatter = DateFormatter()
       dateFormatter.dateFormat = "yyyy MM dd"
       return dateFormatter.string(from: self)
     }
    
     func isSameDay(as day: Date) -> Bool {
       return self.yearMonthDay == day.yearMonthDay
     }
    
    func formatted(as format : String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}
