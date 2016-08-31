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
    
    /*
     var zodiacMap =
     [["Aries":"♈"],
     ["Taurus":"♉"],
     ["Gemini":"♊"],
     ["Cancer":"♋"],
     ["Leo":"♌"],
     ["Virgo":"♍"],
     ["Libra":"♎"],
     ["Scorpius":"♏"],
     ["Sagittarius":"♐"],
     ["Capricorn":"♑"],
     ["Aquarius":"♒"],
     ["Pisces":"♓"]]
     */
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var yearTitleLabel: UILabel!
    @IBOutlet weak var yearPicLabel: UILabel!
    @IBOutlet weak var zodiacTitleLabel: UILabel!
    @IBOutlet weak var zodiacPicLabel: UILabel!
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
        let year = NSCalendar.currentCalendar().component(.Year, fromDate: datePicker.date)
        let month = NSCalendar.currentCalendar().component(.Month, fromDate: datePicker.date)
        let day = NSCalendar.currentCalendar().component(.Day, fromDate: datePicker.date)
        print(year,month,day)
        
        var absYear = 4 - year
        if absYear < 0 {
            absYear *= -1
        }
        
        let y  = ( absYear % 12)
        print(y)
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
        else if y == 11 {
            yearPicLabel.text = "🐖"
            yearTitleLabel.text = "Pig"
        }
        
        var altDay = (month * 100 ) + day
        
        if altDay > 1222 {//Capricorn
            zodiacPicLabel.text = "♈"
            zodiacTitleLabel.text = "Capricorn"
        }
        else if altDay > 1122{//Sagittarius
            zodiacPicLabel.text = "♉"
            zodiacTitleLabel.text = "Sagittarius"
        }
        else if altDay > 1023{//Scorpio
            zodiacPicLabel.text = "♊"
            zodiacTitleLabel.text = "Scorpio"
        }
        else if altDay > 923{//Libra
            zodiacPicLabel.text = "♋"
            zodiacTitleLabel.text = "Libra"
        }
        else if altDay > 823{//Virgo
            zodiacPicLabel.text = "♌"
            zodiacTitleLabel.text = "Virgo"
        }
        else if altDay > 723{//Leo
            zodiacPicLabel.text = "♍"
            zodiacTitleLabel.text = "Leo"
        }
        else if altDay > 621{//Cancer
            zodiacPicLabel.text = "♎"
            zodiacTitleLabel.text = "Cancer"
        }
        else if altDay > 521{//Gemini
            zodiacPicLabel.text = "♏"
            zodiacTitleLabel.text = "Gemini"
        }
        else if altDay > 521{//Taurus
            zodiacPicLabel.text = "♐"
            zodiacTitleLabel.text = "Taurus"
        }
        else if altDay > 321{//Aries
            zodiacPicLabel.text = "♑"
            zodiacTitleLabel.text = "Aries"
        }
        else if altDay > 219{//Pisces
            zodiacPicLabel.text = "♒"
            zodiacTitleLabel.text = "Pisces"
        }
        else if altDay > 120{//Aquarius
            zodiacPicLabel.text = "♓"
            zodiacTitleLabel.text = "Aquarius"
        }
        else if altDay >= 101{//Capricorn
            zodiacPicLabel.text = "♈"
            zodiacTitleLabel.text = "Capricorn"
        }
        
    }
    
    @IBAction func dateChanged() {
        print(datePicker.date)
        updateViews()
    }

    
    
}

