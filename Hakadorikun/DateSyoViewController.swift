//
//  DateSyoViewController.swift
//  Hakadorikun
//
//  Created by 奥若菜 on 2021/04/10.
//

import UIKit
import RealmSwift

class DateSyoViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    var SelectDate:Date? = nil
    

    @IBOutlet weak var eventTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        eventTable.delegate = self
        eventTable.dataSource = self
        
    }

    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let ModifiedDate = Calendar.current.date(byAdding: .day, value: 1, to: SelectDate!)!
        
        let realm = try! Realm()
        let data = realm.objects(EventObj.self).filter("%@ <= start_time && start_time < %@",SelectDate as Any,ModifiedDate)
        
        return data.count
        
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let title:[String] = ["イベント","課題"]
        return title[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let ModifiedDate = Calendar.current.date(byAdding: .day, value: 1, to: SelectDate!)!
        
        let realm = try! Realm()
        let data = realm.objects(EventObj.self).filter("%@ <= start_time && start_time < %@",SelectDate as Any,ModifiedDate)
        
        let object = data[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Eventcell",
                                                     for: indexPath)
        
        let labelTitle = cell.viewWithTag(1) as! UILabel
        labelTitle.text = object.title
        
        let labelPlace = cell.viewWithTag(2) as! UILabel
        labelPlace.text = object.place
        
        return cell
    }
    
    func tableView(_ table: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
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
