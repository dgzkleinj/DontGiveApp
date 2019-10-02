//
//  CalendarViewController.swift
//  DontGiveApp
//
//  Created by Diego Klein on 30/09/19.
//  Copyright © 2019 Diego Klein. All rights reserved.
//

import Foundation
import UIKit

enum MyTheme {
    case light
    case dark
}

class CalendarViewController: UIViewController {
    
    var colorCal: Colors!
    var theme = MyTheme.light
    var text: String! = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Mood Calendar"
        self.navigationController?.navigationBar.isTranslucent=false
        self.view.backgroundColor=Style.bgColor
        
        view.addSubview(calenderView)
        calenderView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive=true
        calenderView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -12).isActive=true
        calenderView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 12).isActive=true
        calenderView.heightAnchor.constraint(equalToConstant: 365).isActive=true
        
//        let rightBarBtn = UIBarButtonItem(title: "Light", style: .plain, target: self, action: #selector(rightBarBtnAction))
//        self.navigationItem.rightBarButtonItem = rightBarBtn
    }
    
//    func choosingCalendarButtonColor(_ text: String) -> Colors {
//        if(text == "sad"){
//            let colorCal = Colors.hintOfIcePack
//        }
//        else if(text == "neutral"){
//            let colorCal = Colors.juneBud
//        }
//        else{
//            let colorCal = Colors.pinkGlamour
//        }
//        return colorCal: Colors
//    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        calenderView.myCollectionView.collectionViewLayout.invalidateLayout()
    }
    
//    @objc func rightBarBtnAction(sender: UIBarButtonItem) {
//        if theme == .dark {
//            sender.title = "Dark"
//            theme = .light
//            Style.themeLight()
//        } else {
//            sender.title = "Light"
//            theme = .dark
//            Style.themeDark() 
//        }
//        self.view.backgroundColor=Style.bgColor
//        calenderView.changeTheme()
//    }
    
    let calenderView: CalenderView = {
        let v=CalenderView(theme: MyTheme.light)
        v.translatesAutoresizingMaskIntoConstraints=false
        return v
    }()
    
}

