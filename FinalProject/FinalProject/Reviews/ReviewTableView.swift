//
//  ReviewTableView.swift
//  FinalProject
//
//  Created by salo khizanishvili on 16.09.22.
//

import UIKit
import CoreData

var ReviewsList = [MovieReview]()
class ReviewTableView: UITableViewController{
    
    var load = true
    
    func notesThatAreNotDeleted() -> [MovieReview]{
        var notesThatAreNotDeleted = [MovieReview]()
        for note in ReviewsList {
            if(note.delete == nil){
                notesThatAreNotDeleted.append(note)
            }
        }
        return notesThatAreNotDeleted
    }
    
    
    override func viewDidLoad() {
        if(load){
            load = false
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "MovieReview")
            do {
                let results: NSArray = try context.fetch(request) as NSArray
                for result in results {
                    let note = result as! MovieReview
                    ReviewsList.append(note)
                }
            }
            catch{
                print("failed")
            }
        }
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewCellID", for: indexPath)as! ReviewCell
        let note: MovieReview!
        note = notesThatAreNotDeleted()[indexPath.row]
        cell.TitleLbl.text = note.title
        cell.ReviewLbl.text = note.reviewText
       
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notesThatAreNotDeleted().count
    }
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "editNote", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "editNote"){
            let indexPath = tableView.indexPathForSelectedRow!
            let noteDeTail = segue.destination as? ReviewDetailVC
            let selectNote : MovieReview!
            selectNote = notesThatAreNotDeleted()[indexPath.row]
            noteDeTail!.selectNote = selectNote
            
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
}
