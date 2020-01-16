import UIKit

//func dateFormate(date : Int) -> String {
////     let lang = UserDefaults.standard.string(forKey: "i18n_language")
//    let date = Date(timeIntervalSince1970: TimeInterval(date))
//    let dateFormatter = DateFormatter()
//    dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
//    dateFormatter.locale = NSLocale.current
//    dateFormatter.dateFormat = "dd MMM yyyy"
//    let strDate = dateFormatter.string(from: date)
//    return strDate
//}
//
let companyATiming1 = (start: 1575950700, end: 1575979800 )
//let startDate = dateFormate(date: companyATiming1.start)
//let endDate = dateFormate(date: companyATiming1.end)
//
//print(startDate)
//print(endDate)
//
//func timeFormate(unixTime: Int) -> String {
//
////let lang = UserDefaults.standard.string(forKey: "i18n_language")
//let date = Date(timeIntervalSince1970: TimeInterval(unixTime))
//let dateFormatter = DateFormatter()
//// Returns date formatted as 12 hour time.
//dateFormatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
//return dateFormatter.string(from: date as Date)
//}
//
//
//let startTiming = timeFormate(unixTime: companyATiming1.start)
//let endTiming = timeFormate(unixTime: companyATiming1.end)
//
//print(startTiming)
//print(endTiming)
//
//
//let dateMaker = DateFormatter()
//dateMaker.dateFormat = "yyyy/MM/dd HH:mm:ss"
//let start = dateMaker.date(from: startTiming)!
//let end = dateMaker.date(from: endTiming)!
//
//func isBetweenMyTwoDates(date: Date) -> Bool {
//    if start.compare(date) == .orderedAscending && end.compare(date) == .orderedDescending {
//        return true
//    }
//    return false
//}
//
//print(isBetweenMyTwoDates(date: dateMaker.date(from: "2019/12/10 8:05:00")!)) // prints true
////print(isBetweenMyTwoDates(date: dateMaker.date(from: "2015/04/15 17:00:00")!)) // prints false
//
//
//

class DateTimeValidator {

    private let format = "yyyy/MM/dd HH:mm:ss"
    
    func isBetweenTwoDates(selectedDate: String, startTime:Int , endTime: Int ) -> Bool {
        let startTime = timeFormate(unixTime: startTime)
        let endTime = timeFormate(unixTime: endTime)
        let dateMaker = DateFormatter()
        dateMaker.dateFormat = format
        let date = dateMaker.date(from: selectedDate)!
        let result = isBetweenMyTwoDates(date: date, start: startTime, end: endTime) // prints true
        print(result)
        return result
    }
    
    func getTime(unixTime: Int) -> Date? {
        //let lang = UserDefaults.standard.string(forKey: "i18n_language")
        let date = Date(timeIntervalSince1970: TimeInterval(unixTime))
        let dateFormatter = DateFormatter()
        //   // Returns date formatted as 12 hour time.
        dateFormatter.dateFormat = format

        return date
    }

}




private extension DateTimeValidator {
    
    private func isBetweenMyTwoDates(date: Date, start: String, end: String) -> Bool {
        
        let dateMaker = DateFormatter()
        dateMaker.dateFormat = format
        let start = dateMaker.date(from: start)!
        let end = dateMaker.date(from: end)!
        
        if start.compare(date) == .orderedAscending && end.compare(date) == .orderedDescending {
            return true
        }
        return false
    }
    
    private func timeFormate(unixTime: Int, formate:String =  "yyyy/MM/dd HH:mm:ss") -> String {
        
        //let lang = UserDefaults.standard.string(forKey: "i18n_language")
        let date = Date(timeIntervalSince1970: TimeInterval(unixTime))
        let dateFormatter = DateFormatter()
        //   // Returns date formatted as 12 hour time.
        dateFormatter.dateFormat = formate
        let result = dateFormatter.string(from: date as Date)
        print("TimeFormatter: \(result)")
        return result
    }
    
    
    
}


let dateValidator = DateTimeValidator()
 let isValid = dateValidator.isBetweenTwoDates(selectedDate:"2019/12/10 9:4:00",
                                startTime: companyATiming1.start,
                                endTime: companyATiming1.end)
if isValid == true {
   print ("selected date time is valid")
}
else {
    print("selected date time is not valid")
}

print(dateValidator.getTime(unixTime: companyATiming1.start))
let minimuDate = dateValidator.getTime(unixTime: companyATiming1.start)
let maxDate = dateValidator.getTime(unixTime: companyATiming1.end)
