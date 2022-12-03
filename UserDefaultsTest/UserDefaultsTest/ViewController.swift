//
//  ViewController.swift
//  UserDefaultsTest
//
//  Created by Teacher on 26.11.2022.
//

import UIKit

struct Note: Codable {
    let title: String
    let date: String
    let content: String
    init(title: String, date: String, content: String) {
            self.title = title
            self.date = date
            self.content = content
        }

}

class ViewController: UIViewController {
  
        
   lazy var notes: [Note] = loadd()
    

    
    @IBOutlet var addButton: UIBarButtonItem!
    @IBOutlet var notesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        notesTableView.dataSource = self
        notesTableView.delegate = self
   
        
        
    }
    
    func loadd() -> [Note] {
        guard let encodedData = UserDefaults.standard.array(forKey: "note") as? [Data] else {
            return []
        }

        return encodedData.map { try! JSONDecoder().decode(Note.self, from: $0) }
    }
    
    func save(_ note: [Note]) {
        let data = notes.map { try? JSONEncoder().encode($0) }
        UserDefaults.standard.set(data, forKey: "note")
    }
    

    @IBAction
    private func openNote() {
        guard let createVc = storyboard?.instantiateViewController(withIdentifier: "NoteController") as? NoteController
        else { return }
        createVc.delegate = self
        present(createVc, animated: true)

    }
}

extension ViewController: UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "idCell") as? NotesTableCell else { return UITableViewCell() }
        cell.titleLabel.text = notes[indexPath.row].title

        cell.dateLabel.text = notes[indexPath.row].date
       
  
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
  
        return notes.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       70
   }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool
    {
        return true
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath)
    {
       if editingStyle == .delete
       {
          notes.remove(at: indexPath.row)
           save(notes)
          tableView.reloadData()
       }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let portfolio = notes[indexPath.row]
        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "NoteController") as! NoteController
        controller.label = portfolio.title
        controller.content = portfolio.content
        controller.count = indexPath.row
        
        controller.delegate1 = self
        present(controller, animated: true)
        notes.remove(at: indexPath.row)
        
    }
}

extension ViewController: CreatePlanDelegate {
    func savePlan(for plan: Note) {
        print(plan)
   
        notes.insert(plan, at: 0)
        DispatchQueue.main.async { self.notesTableView.reloadData() }
    }
}

extension ViewController: ReloadDelegate{
    func reloadPlan(for plan: Note, count: Int) {
        print(plan)
   
        notes.insert(plan, at: count)
        DispatchQueue.main.async { self.notesTableView.reloadData() }
    }
    
   
}
