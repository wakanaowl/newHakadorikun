//
//  SampleDataViewController.swift
//  Hakadorikun
//
//  Created by 奥若菜 on 2021/04/11.
//

import UIKit
import SwiftyJSON
import Alamofire


class SampleDataViewController: UIViewController{
    
    @IBOutlet weak var Event: UILabel!
    
    @IBOutlet weak var StartTime: UILabel!
    
    @IBOutlet weak var EndTime: UILabel!
        

    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
        
        
        
    }
    

    
    @IBAction func onegai(_ sender: Any) {
        
        let url = "https://hakadorikun.herokuapp.com/sampledata"
        
        AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default).responseJSON
        { [self] (respose) in
            

            let json:JSON = JSON(respose.data as Any)
            let EventString = json["name"].string
            let StartTimeString = json["from_time"].string
            let EndTimeString = json["to_time"].string
            
                
            Event.text = EventString
            StartTime.text = StartTimeString
            EndTime.text = EndTimeString
            
        }
            
        
        
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
