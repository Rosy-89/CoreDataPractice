//
//  changeNavBarAppearance.swift
//  CoreDataPractice
//
//  Created by Alok Kumar Naik on 26/02/2021.
//

import UIKit
class NavBarHelper{
    static func changeNavBarAppearance(){
        let barButtonItemAppearance = UIBarButtonItem.appearance()
        barButtonItemAppearance.setBackgroundImage(UIImage(systemName: "deer"), for: .normal,barMetrics: .default)
        let navAppearance = UINavigationBar.appearance()
        let emptyImage = UIImage()
        navAppearance.backIndicatorImage = emptyImage
        navAppearance.backIndicatorTransitionMaskImage = emptyImage
        navAppearance.barTintColor = UIColor(patternImage: UIImage(named: "deer")!)
    }
}
