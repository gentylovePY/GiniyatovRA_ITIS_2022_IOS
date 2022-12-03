//
//  NoteController.swift
//  UserDefaultsTest
//
//  Created by Teacher on 26.11.2022.
//

import UIKit



protocol CreatePlanDelegate: AnyObject{
    func savePlan(for plan: Note)
}

protocol ReloadDelegate: AnyObject{
    func reloadPlan(for plan: Note, count: Int)
}

class NoteController: UIViewController {
    @IBOutlet
    private var textField: UITextField!
    weak var delegate: CreatePlanDelegate?
    weak var delegate1: ReloadDelegate?
    lazy var nots:[Note] = loadd()
    var label:String?
    var content:String?
    var count:Int?

    @IBOutlet private var textView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()


        textView.layer.borderColor = UIColor.systemGray3.cgColor
        textView.layer.borderWidth = 1
        textView.layer.cornerRadius = 12
        
        textField.text = label
        textView.text = content

    }
    
    func save(_ note: [Note]) {
        let data = nots.map { try? JSONEncoder().encode($0) }
        UserDefaults.standard.set(data, forKey: "note")
    }
    
    func loadd() -> [Note] {
        guard let encodedData = UserDefaults.standard.array(forKey: "note") as? [Data] else {
            return []
        }

        return encodedData.map { try! JSONDecoder().decode(Note.self, from: $0) }
    }

    @IBAction private func doneTap() {

        let currentDateTime = Date()
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        formatter.dateStyle = .long
      
      
        guard let title = textField.text, let content = textView.text else { return }

        let notets = Note(title: title, date:  formatter.string(from: currentDateTime) , content: content)
        if(count != nil){
            let notetss = Note(title: title, date:  nots[count!].date , content: content)
            nots.remove(at: count!)
            nots.insert(notetss, at: count!)
            save(nots)
            delegate1?.reloadPlan(for: notetss,count: count!)
            
        }else{
            
                 nots.insert(notets, at: 0)
                 save(nots)
            delegate?.savePlan(for: notets)
        }
       
        dismiss(animated: true)
      
    }
}
