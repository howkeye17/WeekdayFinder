//
//  ViewController.swift
//  WeekdayFinder
//
//  Created by Valera Vasilevich on 11.04.21.
//

import UIKit

class ViewController: UIViewController {

    // textField outlets
    
    @IBOutlet weak var dateTF: UITextField!
    @IBOutlet weak var monthTF: UITextField!
    @IBOutlet weak var yearTF: UITextField!
    
    //result label
    @IBOutlet weak var resultLabel: UILabel!
    
    //button
    @IBAction func findDay(_ sender: UIButton) {
        
        guard let day = dateTF.text, let month = monthTF.text, let year = yearTF.text else { return }
        
        let calendar = Calendar.current
        var dateComponents = DateComponents()
        dateComponents.day = Int(day)
        dateComponents.month = Int(month)
        dateComponents.year = Int(year)
        
        let dateFormatter = DateFormatter()
        
       // Locale for Russian language
        //dateFormatter.locale = Locale(identifier: "ru_Ru")
        
        dateFormatter.dateFormat = "EEEE"
        
        guard let date = calendar.date(from: dateComponents) else { return }
        
        let weekday = dateFormatter.string(from: date)
        
        resultLabel.text = weekday.capitalized
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

