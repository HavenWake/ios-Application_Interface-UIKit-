//
//  PostViewController.swift
//  Navigation
//
//  Created by Семён Пряничников on 29.03.2022.
//

import UIKit

class PostViewController: UIViewController {
    
    var titlePost: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = titlePost
        view.backgroundColor = .systemYellow
        
        let infoButton = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: #selector(openInfo))
        
        navigationItem.rightBarButtonItem = infoButton
        
        
        
    }
    
    @objc func openInfo() {
        let infoViewController = InfoViewController()
        present(infoViewController, animated: true, completion: nil)
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
