//
//  ReviewDetailVC.swift
//  FinalProject
//
//  Created by salo khizanishvili on 16.09.22.
//

import UIKit
import CoreData

class ReviewDetailVC: UIViewController {

    @IBOutlet weak var MovieNameTextField: UITextField!
    @IBOutlet weak var MovieReviewTextView: UITextView!
    var selectNote : MovieReview? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        if(selectNote != nil){
            MovieNameTextField.text = selectNote?.title
            MovieReviewTextView.text = selectNote?.reviewText
        }
        
    }

    @IBAction func saveBtn(_ sender: Any) {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
            if(selectNote == nil){
            let entity = NSEntityDescription.entity(forEntityName: "MovieReview", in: context)
            let myNote = MovieReview(entity: entity!, insertInto: context)
            myNote.id = ReviewsList.count as NSNumber
            myNote.title = MovieNameTextField.text
            myNote.reviewText = MovieReviewTextView.text
            do{
                try context.save()
                ReviewsList.append(myNote)
                navigationController?.popViewController(animated: true)
            }
            catch{
                print("error")
            }
        }
        else{
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "MovieReview")
            do {
                let results: NSArray = try context.fetch(request) as NSArray
                for result in results {
                    let note = result as! MovieReview
                    if(note == selectNote){
                        note.title = MovieNameTextField.text
                        note.reviewText = MovieReviewTextView.text
                        try context.save()
                        navigationController?.popViewController(animated: true)
                    }
                }
            }
            catch{
                print("failed")
            }
        }
        
    }
    
    
    @IBAction func noteDeleteBtn(_ sender: Any) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "MovieReview")
        do {
            let results: NSArray = try context.fetch(request) as NSArray
            for result in results {
                let note = result as! MovieReview
                if(note == selectNote){
                    note.delete = Date()
                    try context.save()
                    navigationController?.popViewController(animated: true)
                }
            }
        }
        catch{
            print("failed")
        }
        
    }
}
