//
//  AuthorViewController.swift
//  BullsEye
//
//  Created by Daniel Cohen on 11/11/2017.
//  Copyright © 2017 Daniel Cohen. All rights reserved.
//

import UIKit

class AuthorViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func backButton() {
        dismiss(animated: true, completion: nil)
    }

}
