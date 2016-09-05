//: Playground - noun: a place where people can play

import UIKit
let allComponents : NSCalendarUnit = [
    .Era,
    .Year,
    .Month,
    .Day,
    .Hour,
    .Minute,
    .Second,
    .Weekday,
    .WeekdayOrdinal,
    .Quarter,
    .WeekOfMonth,
    .WeekOfYear,
    .YearForWeekOfYear,
    .Nanosecond,
    .Calendar,
    .TimeZone
]

var today = NSDate(timeIntervalSince1970: -2207540000)
var cal = NSCalendar(calendarIdentifier: NSCalendarIdentifierChinese)

cal?.component(.Year, fromDate: today)
cal?.component(.Month, fromDate: today)
cal?.component(.Day, fromDate: today)
cal?.component(.Era, fromDate: today)
let all = cal?.components(allComponents, fromDate: today)
print(all)

let fmt = NSDateFormatter()
fmt.locale = NSLocale(localeIdentifier: "en_US_POSIX")
fmt.dateStyle = .FullStyle

fmt.calendar = cal
print(fmt.stringFromDate(today))
