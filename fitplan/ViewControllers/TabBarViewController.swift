//
//  TabBarViewController.swift
//  fitplan
//
//  Created by user230748 on 5/14/23.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let home = HomeViewController()
        home.title = "Home"
        home.navigationItem.largeTitleDisplayMode = .always
        let navHome = UINavigationController(rootViewController: home)
        navHome.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 1)
        
        let schedules = CustomScheduleViewController()
        schedules.title = "Schedules"
        schedules.navigationItem.largeTitleDisplayMode = .always
        let navSchedules = UINavigationController(rootViewController: schedules)
        navSchedules.tabBarItem = UITabBarItem(title: "Schedules", image: UIImage(systemName: "calendar"), tag: 2)
        
        let profile = ProfileViewController()
        profile.title = "Profile"
        profile.navigationItem.largeTitleDisplayMode = .always
        let navProfile = UINavigationController(rootViewController: profile)
        navProfile.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person"), tag: 3)
        
        let progress = ProgressViewController()
        progress.title = "Progress"
        progress.navigationItem.largeTitleDisplayMode = .always
        let navProgress = UINavigationController(rootViewController: progress)
        navProgress.tabBarItem = UITabBarItem(title: "Progress", image: UIImage(systemName: "chart.bar"), tag: 4)
                
        setViewControllers([navHome, navProgress, navSchedules, navProfile], animated: true)
    }


}
