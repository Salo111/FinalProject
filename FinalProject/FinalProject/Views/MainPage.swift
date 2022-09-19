//
//  MainPage.swift
//  FinalProject
//
//  Created by salo khizanishvili on 08.09.22.
//

import UIKit

class MainPage: UIViewController {

    @IBOutlet weak var constraint: NSLayoutConstraint!
    @IBOutlet weak var MovingView: UIView!
    @IBOutlet weak var menuBtn: UIButton!
    
    var showMenu = false
    override func viewDidLoad() {
        super.viewDidLoad()
        constraint.constant = -276
        MovingView.isHidden = true
    }
    
    @IBAction func menuButton(_ sender: Any) {
        if(showMenu){
            MovingView.isHidden = false
            constraint.constant = -276
            let color = UIColor(hexFromString: "CDCAFF")
            view.backgroundColor = color
            UIView.animate(withDuration: 0.4){
                self.view.layoutIfNeeded()
            }
        }
           
        else{
            MovingView.isHidden = false
            constraint.constant = 0
            view.backgroundColor = .lightGray
            UIView.animate(withDuration: 0.4){
                self.view.layoutIfNeeded()
            }
        }
        showMenu = !showMenu
    }
    
    
    
        @IBAction func Home(_ sender: Any) {
    }
    
    @IBAction func LogOut(_ sender: Any) {
        let timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(Logout), userInfo: nil, repeats: false)
    }
    
    @objc func Logout() {
        _ = navigationController?.popViewController(animated: true)
    }
    
    
}
