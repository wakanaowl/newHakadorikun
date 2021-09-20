//
//  EventEditTableViewController.swift
//  Hakadorikun
//
//  Created by 奥若菜 on 2021/06/02.
//

import UIKit
import RealmSwift

class object: NSObject {
    
    static let instance = object()
    var Localdata = ""
    var Localdetail = ""
    
    
}



class EventEditTableViewController: UITableViewController, UITextFieldDelegate  {
    
    
    @IBOutlet weak var EventTitle: UITextField!
    @IBOutlet weak var localLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var EventTableView:
        UITableView!
    
    @IBOutlet weak var URLLabel: UITextField!
    
    
    @IBOutlet weak var MemoLabel: PlaceHolderTextView!
    
    
    @IBOutlet weak var StartPicker: Datepicker!
    @IBOutlet weak var EndPicker: Datepicker!
    
    var itemList: Results<EventObj>!
    let sample = object.instance
    
    var Jswitch = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let realm = try! Realm()
        let data = realm.objects(EventObj.self)
        EventTitle.delegate = self
        EventTitle.text = data.last?.title
        detailLabel.text = data.last?.address
        URLLabel.text = data.last?.url
        MemoLabel.text = data.last?.memo
        
        if data.last?.start_time == nil {
            
        } else {
            
            StartPicker.date = data.last!.start_time!
        }
        
        if data.last?.end_time == nil {
            
        } else {
            
            EndPicker.date = data.last!.end_time!
        }
        
        
        
        
        if data.last?.place == nil {
            localLabel.text = "場所"
            
        }
        else{
            localLabel.text = data.last?.place
            localLabel.textColor = UIColor.black
        }
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
                super.viewWillAppear(animated)
            
            if sample.Localdata == "" {
                
            }
            else{
                localLabel.text = sample.Localdata
                localLabel.textColor = UIColor.black
            }

            if sample.Localdetail == "" {

                  if sample.Localdata != ""{
                      detailLabel.text = ""
                  }

              }
            else{
                detailLabel.text = sample.Localdetail
            }
                
        }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 5
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        switch section{
        case 0:
            return 2
        case 1:
            return 3
        case 2:
            return 1
        case 3:
            return 2
        case 4:
            return 1
        default:
            return 0
        }
    }
    
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 17
    }
    //Footerの高さ
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        //guard let header = view as? UITableViewHeaderFooterView else { return }
        //header.contentView.backgroundColor = UIColor.green
        //Headerの背景色を設定
        let headerView = UIView()
        headerView.backgroundColor = UIColor.red
        
    }
    
    override func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        //guard let footer = view as? UITableViewHeaderFooterView else { return }
        //Footerの背景色を設定
        //footer.contentView.backgroundColor = UIColor.green
        
//        let footerView = UIView()
//        footerView.backgroundColor = UIColor.red
        //背景色
    }
    
    struct LocalData {
        let local: String
        let detail: String
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
//        if segue.identifier == "toLocalView"{
//            let next = segue.destination as? LocalViewController
//
//
////            next?.resultHandler = { text in
////
////                self.localLabel.text = text
////                self.detailLabel.text = text
////                self.localLabel.textColor = UIColor.black
////
////            }
//        }
//
//
//
//
//    }
//
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
      // keyboardを隠す
      textField.resignFirstResponder()

      return true
    }
    
    
    @IBAction func Switch(_ sender: UISwitch) {
        if ( sender.isOn ) {
                    Jswitch = 1
                }
                else{
                    Jswitch = 0
                }
    }
    
    @IBAction func InputButton(_ sender: Any) {
        
        if StartPicker.date <= EndPicker.date {
            
            let instancedEventObj:EventObj = EventObj()
            
            let realmInstance = try! Realm()
            
            try! realmInstance.write{
                instancedEventObj.title = self.EventTitle.text!
                instancedEventObj.place = self.localLabel.text!
                instancedEventObj.address = self.detailLabel.text!
                instancedEventObj.url = self.URLLabel.text!
                instancedEventObj.memo = self.MemoLabel.text!
                
                //↓日時をRealmに送る
                instancedEventObj.start_time = StartPicker.date
                instancedEventObj.end_time = EndPicker.date
                
                instancedEventObj.all_day = self.Jswitch
                
                
                realmInstance.add(instancedEventObj)
                
                print(StartPicker.date)
                
            }
            
            self.EventTableView.reloadData()
        
            sample.Localdata = ""
            sample.Localdetail = ""
            
            print(instancedEventObj.place)
            
            self.navigationController?.popViewController(animated: true)
    //        EventTitle.resignFirstResponder()
    //        let newEvent = EventObj()
    //        newEvent.title = EventTitle.text!
    //
    //            do{
    //                let realm = try Realm()
    //                try realm.write({()->Void in realm.add(newEvent); print("Event Saved")})
    //
    //            }catch{
    //                print("Save is Faild")
    //            }
        }
      

    }
    
    
    @IBAction func CancelButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        sample.Localdata = ""
        sample.Localdetail = ""
    }
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//        if indexPath.section == 1 && indexPath.row == 2{
//            let storyboard: UIStoryboard = self.storyboard!
//            let vc = storyboard.instantiateViewController(withIdentifier: "LocalViewController")
//
//            let nav = UINavigationController(rootViewController: vc)
//            self.present(nav,animated: true)
//        }
//
//    }
    

}
