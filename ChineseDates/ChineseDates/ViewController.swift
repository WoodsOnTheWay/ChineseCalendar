//
//  ViewController.swift
//  ChineseDates
//
//  Created by Paul Wood on 8/31/16.
//  Copyright © 2016 Paul Wood. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //"🐀🐂🐅🐇🐉🐍🐎🐑🐒🐓🐕🐖"
    /*:
     rat
     ox
     tiger
     rabbit
     dragon
     snake
     horse
     sheep
     monkey
     rooster
     dog
     pig
     */
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var yearTitleLabel: UILabel!
    @IBOutlet weak var yearPicLabel: UILabel!

    @IBOutlet weak var timePicker: UIPickerView!
    @IBOutlet weak var timezonePicker: UIPickerView!
    
    @IBOutlet weak var timeSegmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateViews(){
        setYearLabels()
    }
    
    @IBAction func timeSegmentedControlChanged(sender: UISegmentedControl) {
        updateViews()
        switch sender.selectedSegmentIndex {
        case 0:
            datePicker.hidden = false
            timePicker.hidden = true
            timezonePicker.hidden = true
        
        case 1:
            datePicker.hidden = true
            timePicker.hidden = false
            timezonePicker.hidden = true
        
        case 2:
            datePicker.hidden = true
            timePicker.hidden = true
            timezonePicker.hidden = false
        
        default:
            break
        }
    }
    
    func setYearLabels(){
        let chineseCal = NSCalendar(calendarIdentifier: NSCalendarIdentifierChinese)!
        let year = chineseCal.component(.Year, fromDate: datePicker.date)
        let month = chineseCal.component(.Month, fromDate: datePicker.date)
        let day = chineseCal.component(.Day, fromDate: datePicker.date)
        debugPrint(year,month,day)
        
        let y  = ( (year - 1)  % 12)
        debugPrint("year",year,y)
        if y == 0 {
            yearPicLabel.text = "🐀"
            yearTitleLabel.text = "Rat"
        }
        else if y == 1 {
            yearPicLabel.text = "🐂"
            yearTitleLabel.text = "Ox"
        }
        else if y == 2 {
            yearPicLabel.text = "🐅"
            yearTitleLabel.text = "Tiger"
        }
        else if y == 3 {
            yearPicLabel.text = "🐇"
            yearTitleLabel.text = "Rabbit"
        }
        else if y == 4 {
            yearPicLabel.text = "🐉"
            yearTitleLabel.text = "Dragon"
        }
        else if y == 5 {
            yearPicLabel.text = "🐍"
            yearTitleLabel.text = "Snake"
        }
        else if y == 6 {
            yearPicLabel.text = "🐎"
            yearTitleLabel.text = "Horse"
        }
        else if y == 7 {
            yearPicLabel.text = "🐑"
            yearTitleLabel.text = "Sheep"
        }
        else if y == 8 {
            yearPicLabel.text = "🐒"
            yearTitleLabel.text = "Monkey"
        }
        else if y == 9 {
            yearPicLabel.text = "🐓"
            yearTitleLabel.text = "Rooster"
        }
        else if y == 10 {
            yearPicLabel.text = "🐕"
            yearTitleLabel.text = "Dog"
        }
        else {//if y == 11 {
            yearPicLabel.text = "🐖"
            yearTitleLabel.text = "Pig"
        }
    }
    
    @IBAction func dateChanged() {
        debugPrint(datePicker.date)
        updateViews()
    }

    let timeZones : [String:[String]] = {
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
            let name = specific.componentsSeparatedByString("_").joinWithSeparator(" ")
            
            addToSeperated(region,name)
        }
        
        return seperated
    }()

    let dayTimes : Array<String> = {
        var times = Array<String>()
        for i in 1...12 {
            times.append(String(i))
        }
        return times
    }()
    let dayMod = {
        
    }()
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 2
    }
    
    var selectedComponent = 0

    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == timezonePicker {
            if component == 0 {
                return timeZones.count
            }
            else { //component == 1
                let sortedKeys = Array(timeZones.keys).sort(<)
                let key = sortedKeys[selectedComponent]
                return timeZones[key]!.count
            }
        }
        else { //if pickerView == timePicker {
            return 12
        }
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        if pickerView == timezonePicker {
            if component == 0 {
                selectedComponent = row
                pickerView.reloadComponent(1)
                return
            }
            else if component == 1 {
                //Set Time Zone here
            }
        }
        else { //if pickerView == timePicker {
            return
        }
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == timezonePicker {
            if component == 0 {
                let sortedKeys = Array(timeZones.keys).sort(<)
                let key = sortedKeys[row]
                return key
            }
            else if component == 1 {
                let sortedKeys = Array(timeZones.keys).sort(<)
                let key = sortedKeys[selectedComponent]
                return timeZones[key]![row]
            }
        }
        else { //if pickerView == timePicker {
            return nil
        }
        return nil
    }
    
}

