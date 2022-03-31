//
//  ProfileViewController.swift
//  Netology_IB_Instruments
//
//  Created by Семён Пряничников on 25.03.2022.
//

import Foundation
import UIKit

class ProfileViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let screenWidth = UIScreen.main.bounds.width
        if let profileView = Bundle.main.loadNibNamed("ProfileView", owner: nil, options: nil)?.first as? ProfileView {
            profileView.frame = CGRect(x: 0, y: 0, width: screenWidth, height: 0)
            view.addSubview(profileView)
        }
    }
    
}
