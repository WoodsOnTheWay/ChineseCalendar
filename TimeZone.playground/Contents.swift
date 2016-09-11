//: # TimeZones

import Foundation

let tzs = NSTimeZone.knownTimeZoneNames()
var seperated : [String:Array<String>] = [String:[String]]()

func addToSeperated(_ region : String,_ place:String) -> Void {
    if let _ = seperated[region] {
        
    }
    else {
        seperated[region] = Array<String>()
    }
    seperated[region]!.append(place)
    print(seperated[region]!.count)
}


for string in tzs {
    let parsed = string.componentsSeparatedByString("/")
    print(parsed)
    guard parsed.count == 2 else {
        continue
    }
    let region = parsed[0]
    let specific = parsed[1]
    addToSeperated(region,specific)
}

print(seperated)
