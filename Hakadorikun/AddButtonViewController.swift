//
//  AddButtonViewController.swift
//  Hakadorikun
//
//  Created by 奥若菜 on 2021/09/25.
//

import UIKit

class AddButtonViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func AddButton(_ sender: Any) {
        let nextVC = EventEditTableViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
        
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
