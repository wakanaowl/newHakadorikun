//
//  KadaiViewController.swift
//  Hakadorikun
//
//  Created by 奥若菜 on 2021/04/01.
//

import UIKit
import RealmSwift
import Floaty


class KadaiViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,FloatyDelegate{
    

    @IBOutlet weak var KadaiTable: UITableView!
    
    //   let realm = try! Realm()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        KadaiTable.delegate = self
        KadaiTable.dataSource = self
        
        let fab = Floaty()
                
        fab.buttonColor = .orange
        fab.plusColor = .white
        
        fab.addItem(title: "課題")
        fab.addItem(title: "イベント"){(item)in
//            let EventEditTableViewController = self.storyboard?.instantiateViewController(withIdentifier: "EventEditTableViewController") as! EventEditTableViewController
            
//            self.navigationController?.pushViewController(EventEditTableViewController, animated: true)
        }
        
//        floaty.addItem("送信", icon: UIImage(named: "send")) { (item) in
//                    // 送信ボタンが押された時の処理
//                }
        
        view.addSubview(fab)
        
    
    
        
        //button.layer.cornerRadius = 32
//        let kadaiData = realm.objects(Kadai.self)
//        print("全てのデータ\(kadaiData)")
        
        // Do any additional setup after loading the view.
    }
    

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ table: UITableView,cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = table.dequeueReusableCell(withIdentifier: "Kadaicell",
                                                     for: indexPath)
//        タグ番号を指定する
//        let label1 = cell.viewWithTag(1) as! UILabel
//        label1.text = String(ここに表示したい変数を入れる)
//        (例)String(describing: label2Array[indexPath.row])  ←配列[indexPath.row]でその行の値を呼び出す

        return cell
    }
    
    func tableView(_ table: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
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
