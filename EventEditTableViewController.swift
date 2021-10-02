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
            var Localdata:String? = nil
            var Localdetail:String? = nil
            
            
        }
        
        class EventEditTableViewController: UITableViewController, UITextFieldDelegate  {
            
            
            var ID:String? = nil
            var SelectDate:Date? = nil
            var rownumber:Int? = nil
            var AddCheck = 0
            
            
            @IBOutlet weak var EventTitle: UITextField!
            @IBOutlet weak var localLabel: UILabel!
            @IBOutlet weak var detailLabel: UILabel!
            @IBOutlet weak var EventTableView:
                UITableView!
            @IBOutlet weak var CircleView: UICircleView!
            
            @IBOutlet weak var URLLabel: UITextField!
            
            
            @IBOutlet weak var MemoLabel: PlaceHolderTextView!
            
            @IBOutlet weak var Switch: UISwitch!
            
            @IBOutlet weak var StartPicker: Datepicker!
            @IBOutlet weak var EndPicker: Datepicker!
            
            var itemList: Results<EventObj>!
            let sample = object.instance
            
            var Jswitch = 0
            
            
            override func viewDidLoad() {
                super.viewDidLoad()
                
                //編集用
                if(AddCheck == 0){
                    let realm = try! Realm()
                    
                    let data = realm.objects(EventObj.self).filter("%@ == ID",ID as Any)
                    
                    
                    EventTitle.delegate = self
                    EventTitle.text = data.last?.title
                    detailLabel.text = data.last?.address
                    URLLabel.text = data.last?.url
                    MemoLabel.text = data.last?.memo
                    StartPicker.date = (data.last?.start_time)!
                    EndPicker.date = (data.last?.end_time)!
                    
                    if (data.last?.all_day == 1){
                        
                        Switch.isOn = true
                        Switch.sendActions(for: .valueChanged)
                    }
                    
                    
                    if data.last?.place == "" {
                        localLabel.text = "場所"
                        detailLabel.text = ""
                        
                    } else {
                        localLabel.text = data.last?.place
                        localLabel.textColor = UIColor.black
                    }
                } else {    //追加用
                    
                    StartPicker.date = Date()
                    
                    let modifiedDate = Calendar.current.date(byAdding: .hour, value: 1, to: StartPicker.date)!
                    
                    EndPicker.date = modifiedDate
                    
                    detailLabel.text = ""
                }
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
            
            //削除機能
            override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
                if(indexPath.section == 4){
                    
                    let realm = try! Realm()
                    
                    let data = realm.objects(EventObj.self).filter("%@ == ID",ID as Any)
                    
                    try! realm.write{
                        realm.delete(data.last!)
                    }
                    
                    let index = navigationController!.viewControllers.count - 3
                    navigationController?.popToViewController(navigationController!.viewControllers[index], animated: true)
                    
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
            
            struct LocalData {
                let local: String
                let detail: String
            }
            
            
            func textFieldShouldReturn(_ textField: UITextField) -> Bool {
                // keyboardを隠す
                textField.resignFirstResponder()
                
                return true
            }
            
            @IBAction func TimeChenge(_ sender: Any) {
                let modifiedDate = Calendar.current.date(byAdding: .hour, value: 1, to: StartPicker.date)!
                
                EndPicker.date = modifiedDate
            }
            
            
            @IBAction func SwitchOn(_ sender: UISwitch) {
                if ( sender.isOn ) {
                    Jswitch = 1
                }
                else{
                    Jswitch = 0
                }
            }
            
            
            
            @IBAction func InputButton(_ sender: Any) {
                
                if(AddCheck == 0){
                    //編集用(上書き)
                    if StartPicker.date <= EndPicker.date {
                        
                        let realm = try! Realm()
                        
                        let instancedEventObj:EventObj = EventObj()
                        
                        instancedEventObj.title = self.EventTitle.text!
                        instancedEventObj.place = self.localLabel.text!
                        instancedEventObj.address = self.detailLabel.text!
                        instancedEventObj.url = self.URLLabel.text!
                        instancedEventObj.memo = self.MemoLabel.text!
                        
                        instancedEventObj.ID = ID!
                        
                        //↓日時をRealmに送る
                        instancedEventObj.start_time = StartPicker.date
                        instancedEventObj.end_time = EndPicker.date
                        
                        instancedEventObj.all_day = self.Jswitch
                        
                        try! realm.write{
                            
                            realm.add(instancedEventObj, update: .modified)
                        }
                        
                        sample.Localdata = ""
                        sample.Localdetail = ""
                        
                        self.navigationController?.popViewController(animated: true)
                        
                    }
                    
                } else { //追加用
                    
                    let dateformatter = DateFormatter()
                    dateformatter.locale = Locale(identifier: "ja_JP")
                    dateformatter.dateFormat = "yyyyMMddHHmmss"
                    
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
                        
                        instancedEventObj.ID = dateformatter.string(from: Date())
                        
                        realmInstance.add(instancedEventObj)
                        
                    }
                }
            }
            
            
            @IBAction func CancelButton(_ sender: Any) {
                self.navigationController?.popViewController(animated: true)
                sample.Localdata = ""
                sample.Localdetail = ""
            }
            
        }
