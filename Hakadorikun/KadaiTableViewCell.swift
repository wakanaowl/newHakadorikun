//
//  KadaiTableViewCell.swift
//  Hakadorikun
//
//  Created by 奥若菜 on 2021/05/08.
//

import UIKit
import RealmSwift



protocol KadaiTableViewCellDelegate {
    func textFieldDidEndEditing(cell: KadaiTableViewCell, value: NSString) -> ()
}

class KadaiTableViewCell: UITableViewCell,UITextFieldDelegate{
    private var kadai: Kadaidata?
    
    var delegate: KadaiTableViewCellDelegate! = nil
    
    @IBOutlet weak var textField: UITextField!
    static let identifire = "KadaiCell"
    
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//            super.init(style: style, reuseIdentifier: reuseIdentifier)
//
//            setUp()
//        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        textField.addTarget(self, action: #selector(textFieldDidEndEditing), for: .editingChanged)

        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    internal func textFieldShouldReturn(_ textField: UITextField) -> Bool {
           textField.resignFirstResponder()
           return true
       }
    
    internal func textFieldDidEndEditing(_ textField: UITextField) {
        self.delegate.textFieldDidEndEditing(cell: self, value: textField.text! as NSString)
//        let newKadai = KadaiObj()
//        newKadai.title = textField.text!
        
//        print(textField.text!)
//
//        do{s
//            let realm = try Realm()
//            try realm.write({()->Void in realm.add(newKadai); print("Kadai Saved")})
//
//        }catch{
//            print("Save is Faild")
//        }
        
        }
    
//    @IBAction func buttonTapped(_ sender: Any) {
//        textField.resignFirstResponder()
//        let newKadai = KadaiObj()
//        newKadai.title = textField.text!
//
//        do{
//            let realm = try Realm()
//            try realm.write({()->Void in realm.add(newKadai); print("Kadai Saved")})
//
//        }catch{
//            print("Save is Faild")
//        }
//
//    }
    

}
