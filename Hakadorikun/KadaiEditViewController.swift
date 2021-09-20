//
//  KadaiEditViewController.swift
//  Hakadorikun
//
//  Created by 奥若菜 on 2021/05/03.
//

import UIKit
import RealmSwift

class KadaiEditViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UITextViewDelegate,KadaiTableViewCellDelegate{
    
    
    
    @IBOutlet weak var EditTable: UITableView!
    
    private var showingDatePicker = false
    private var PickerCell :PickerKadaiTableViewCell?
    private var kadaiTitle = ""

    // Sectionで使用する配列を定義する.

        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        EditTable.delegate = self
        EditTable.dataSource = self
        

    }
    
    override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
        }

    
    @IBAction func CancelButton(_ sender: Any) {
        
//        self.navigationController?.popViewController(animated: true)
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 11
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 1{
            let cell = EditTable.dequeueReusableCell(withIdentifier: "KadaiCell")as!KadaiTableViewCell
            cell.delegate = self
            return cell
        }
        else if indexPath.row == 2{
            let cell = EditTable.dequeueReusableCell(withIdentifier: "KamokuCell")!
            
            return cell
        }
        else if indexPath.row == 4{
            let cell = EditTable.dequeueReusableCell(withIdentifier: "PickerCell")!
            
            return cell
        }
        else if indexPath.row == 6{
            let cell = EditTable.dequeueReusableCell(withIdentifier: "cellURL")!
            
            return cell
        }
        else if indexPath.row == 7{
            let memocell = EditTable.dequeueReusableCell(withIdentifier: "MemoTableViewCell")as! MemoTableViewCell


            
            return memocell
        }
        else if indexPath.row == 9{
            let cell = EditTable.dequeueReusableCell(withIdentifier: "cellDel")!
            return cell
        }
        let cell = EditTable.dequeueReusableCell(withIdentifier: "cellSpace")!
        return cell
    }
    
    func tableView(_ table: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
       // if indexPath.row < 2{
        if indexPath.row == 7{
            return 200
        }
        else if indexPath.row == 0 || indexPath.row == 3 || indexPath.row == 5 || indexPath.row == 8{
            return 25
        }
        else if indexPath.row == 10{
            
            return 171
        }
       
                return 57

       // }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
            guard indexPath.section == 0 else { return }

            // PickerCellを更新する
//            tableView.performBatchUpdates({
                // Pickerを表示する(非表示にする)メソッドを呼ぶ
//                if self.showingDatePicker {
//                    PickerCell?.hidePicker()
//                } else {
//                    PickerCell?.showPicker()
//                }
//            }, completion: { _ in
//                self.showingDatePicker.toggle()
//
//            })
        
            
        }

    func textFieldDidEndEditing(cell: KadaiTableViewCell, value: NSString) -> () {
        
        NSLog("value = %@",value)
        kadaiTitle = value as String

    }
    
//    @IBAction func saveButton(_ sender: Any) {
//        let obj = KadaiObj()
//        obj.kadai = kadaiTitle
//
//        let realm = try! Realm()
//        try! realm.write{
//            realm.add(obj)
//
//        }
//        self.dismiss(animated: true, completion: nil)
//    }
    
    /*.
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

