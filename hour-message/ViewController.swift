//
//  ViewController.swift
//  hour-message
//
//  Created by Cora on 18/09/22.
//

import UIKit

enum Hour {
    case morning
    case evening
    case night
    case dawn
}

class ViewController: UIViewController {

    var morning: Bool?
    var evening: Bool?
    var night: Bool?
    var dawn: Bool?
    var hour: Int?
    
    private lazy var hourMessageView: HourMessageView = {
        let view = HourMessageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(hourMessageView)
        getHour(hour: .morning)
        
        NSLayoutConstraint.activate([
            hourMessageView.topAnchor.constraint(equalTo: view.topAnchor),
            hourMessageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hourMessageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            hourMessageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func getHour(hour: Hour) {
        
        let dateFormatter = DateFormatter()
//        var hour = Calendar.current.component(.hour, from: Date())
        var calendar = Calendar.current
        dateFormatter.timeZone = TimeZone.current
        
        if let timeZone = TimeZone(identifier: "BRST") {
           calendar.timeZone = timeZone
           dateFormatter.timeZone = timeZone
        }
        
        let dateNow = Date.now
        
        
        print(hour)
        print(dateNow)
        print(calendar)
        
        let morning1 = "06:00:00"
        let morning2 = "11:59:59"
        
        let evening1 = "12:00:00"
        let evening2 = "17:59:00"
        
        let night1 = "18:00:00"
        let night2 = "23:59:59"
        
        let dawn1 = "00:00:00"
        let dawn2 = "05:59:59"
//        let dateMorningSixAm = dateFormatter.date(from: morning1)
//        let dateMorningElevenAm = dateFormatter.date(from: morning2)
//
//        let dateEveningMidDay = dateFormatter.date(from: evening1)
//        let dateEveningFivePm = dateFormatter.date(from: evening2)
//
//        let dateNightSixPm = dateFormatter.date(from: night1)
//        let dateNightElevenPm = dateFormatter.date(from: night2)
//
//        let dateDawnMidNight = dateFormatter.date(from: dawn1)
//        let dateDawnFiveAm = dateFormatter.date(from: dawn2)
        
        
        dateFormatter.dateFormat = "HH:mm:ss"
      
        let printAqui = calendar.dateComponents([.hour, .minute, .second], from: dateNow)
        guard let hour = printAqui.hour  else {
            return
        }
        print(dateNow)
        
//
//                let morning6 = calendar.dateComponents([.hour, .minute, .second], from: morningSixAm).hour
//                let morning11 = calendar.dateComponents([.hour, .minute, .second], from: morningElevenAm).hour
//                morning = dateNow.isBetween(morning6 ?? 0, and: morning11 ?? 0, result: hour)
//                return
//            }
//        }
//
//        if let eveningMidDay = dateFormatter.date(from: evening1) {
//            if let eveningFivePm = dateFormatter.date(from: evening2) {
//                let evening12 = calendar.dateComponents([.hour, .minute, .second], from: eveningMidDay).hour
//                let evening5 = calendar.dateComponents([.hour, .minute, .second], from: eveningFivePm).hour
//                evening = dateNow.isBetween(evening12 ?? 0, and: evening5 ?? 0, result: hour)
//                return
//            }
//        }
//
//        if let nightSixPm = dateFormatter.date(from: night1) {
//            if let nightElevenPm = dateFormatter.date(from: night2) {
//                let night6 = calendar.dateComponents([.hour, .minute, .second], from: nightSixPm).hour
//                let night11 = calendar.dateComponents([.hour, .minute, .second], from: nightElevenPm).hour
//                night = dateNow.isBetween(night6 ?? 0, and: night11 ?? 0, result: hour)
//                return
//            }
//        }
        
        guard let morningSixAm = dateFormatter.date(from: morning1) else { return  }
        guard let morningElevenAm = dateFormatter.date(from: morning2) else { return }
        
        guard let eveningMidDay = dateFormatter.date(from: evening1) else { return  }
        guard let eveningFivePm = dateFormatter.date(from: evening2) else { return }
        
        guard let nightSixPm = dateFormatter.date(from: night1) else { return  }
        guard let nightElevenPm = dateFormatter.date(from: night2) else { return }
        
        guard let dawnMidNight = dateFormatter.date(from: dawn1) else { return  }
        guard let dawnFiveAm = dateFormatter.date(from: dawn2) else { return }
        
        let morning = (calendar.component(.hour, from: morningSixAm)...calendar.component(.hour, from: morningElevenAm)).contains(hour)
        let evening = (calendar.component(.hour, from: eveningMidDay)...calendar.component(.hour, from: eveningFivePm)).contains(hour)
        let night = (calendar.component(.hour, from: nightSixPm)...calendar.component(.hour, from: nightElevenPm)).contains(hour)
        let dawn = (calendar.component(.hour, from: dawnMidNight)...calendar.component(.hour, from: dawnFiveAm)).contains(hour)
    
        if morning {
            hourMessageView.messageLabel.text = HourMessageString.messageMorning.localized
            hourMessageView.image.image = UIImage(named: "morning")
            print("Bom dia")
        }
        
        if evening {
            hourMessageView.messageLabel.text = HourMessageString.messageEvening.localized
            hourMessageView.image.image = UIImage(named: "evening")
            print("Boa tarde")
        }
        
        if night {
            hourMessageView.messageLabel.text = HourMessageString.messageNight.localized
            hourMessageView.image.image = UIImage(named: "night")
            print("Boa noite")
        }
        
        if dawn {
            hourMessageView.messageLabel.text = HourMessageString.messageDawn.localized
            hourMessageView.image.image = UIImage(named: "dawn")
            print("Ainda acordado?")
        }
        
//        switch hour {
//        case .morning:
//            dateMorningSixAm.hashValue > dateMorningElevenAm.hashValue
//        case .evening:
//            dateEveningMidDay.hashValue > dateEveningFivePm.hashValue
//        case .night:
//            dateNightSixPm.hashValue > dateNightElevenPm.hashValue
//        case .dawn:
//            dateDawnMidNight.hashValue > dateDawnFiveAm.hashValue
//        }
                                                         }
}

extension Date {
    func isBetween(_ date1: Int, and date2: Int, result: Int) -> Bool {
        return (min(date1, date2) ... max(date1, date2)).contains(result)
    }
}
