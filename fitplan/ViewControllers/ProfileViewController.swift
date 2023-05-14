//
//  ProfileViewController.swift
//  fitplan
//
//  Created by user230748 on 5/14/23.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBackground
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .done, target: self, action: #selector(logoutAction))
    }

    @objc private func logoutAction(){
        
    }

}
