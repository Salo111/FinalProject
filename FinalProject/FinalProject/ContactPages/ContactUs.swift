//
//  ContactUs.swift
//  FinalProject
//
//  Created by salo khizanishvili on 14.09.22.
//

import UIKit
import SwiftUI

class ContactUs: UIViewController {

    @IBOutlet weak var textUsBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        textUsBtn.addTarget(self, action: #selector((didTapButton)), for: .touchUpInside)
    }
    
    @objc func didTapButton(){
        let vc = UIHostingController(rootView: ChatBot())
        present(vc, animated: true)
    }

}
