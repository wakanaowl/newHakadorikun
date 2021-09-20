//
//  PickerKadaiTableViewCell.swift
//  
//
//  Created by 奥若菜 on 2021/05/05.
//

import UIKit

class PickerKadaiTableViewCell: UITableViewCell {
    

//    @IBOutlet weak var containerViewHeight: NSLayoutConstraint!

    @IBOutlet weak var detePicker: UIDatePicker!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }


    @IBAction func datePickerValueDidChange(_ sender: UIDatePicker) {
    
    
        PickerKadaiTableViewCell.dateformatter.dateFormat = "yyyy/MM/dd"
        dateLabel.text = PickerKadaiTableViewCell.dateformatter.string(from: sender.date)
        
        PickerKadaiTableViewCell.timeformatter.dateFormat = "HH:mm"
        timeLabel.text = PickerKadaiTableViewCell.timeformatter.string(from: sender.date)
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
//    func showPicker() {
//            guard datePicker.isHidden else { return }
//
//            // セルの高さの制約の値を変更して、Pickerが見えるようにする
//            containerViewHeight.constant = PickerKadaiTableViewCell.expandedHeight
//            datePicker.isHidden = false
//            UIView.animate(withDuration: 0.25) {
//                self.datePicker.alpha = 1
//                self.layoutIfNeeded()
//            }
//        }
//    func hidePicker() {
//            guard !datePicker.isHidden else { return }
//
//            // セルの高さの制約の値を変更して、Pickerが隠れるようにする
//            containerViewHeight.constant = PickerKadaiTableViewCell.compressedHeight
//            UIView.animate(withDuration: 0.25, animations: {
//                self.datePicker.alpha = 0
//                self.layoutIfNeeded()
//            }, completion: { _ in
//                self.datePicker.isHidden = true
//            })
//        }


}

private extension PickerKadaiTableViewCell {
//    static let compressedHeight: CGFloat = 20
//    static let expandedHeight: CGFloat = 300

    // ...

    static let dateformatter = DateFormatter()
    static let timeformatter = DateFormatter()
    
    
    func prepare() {
        // Picker非表示時用の値を設定
        //containerViewHeight.constant = PickerKadaiTableViewCell.compressedHeight

        let now = Date()
//        datePicker.date = now
//        datePicker.addTarget(self, action: #selector(datePickerValueDidChange), for: .valueChanged)
//
//        // Pickerを非表示にする
//        datePicker.isHidden = true
//        datePicker.alpha = 0
        
        PickerKadaiTableViewCell.dateformatter.dateFormat = "yyyy/MM/dd"
        dateLabel.text = PickerKadaiTableViewCell.dateformatter.string(from: now)
        
        PickerKadaiTableViewCell.timeformatter.dateFormat = "HH:mm"
        timeLabel.text = PickerKadaiTableViewCell.timeformatter.string(from: now)
    }
}
