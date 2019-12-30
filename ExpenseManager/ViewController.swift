//
//  ViewController.swift
//  ExpenseManager
//
//  Created by Tanvir on 12/29/19.
//  Copyright © 2019 tanvir841. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
   // var item : [NSManagedObject] = []
    var isCredit: Bool = true
    @IBOutlet weak var describe: UITextField!
    @IBOutlet weak var amount: UITextField!
    @IBOutlet weak var `switch`: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//           let appDelegate = UIApplication.shared.delegate as! AppDelegate
//             let managedContext = appDelegate.persistentContainer.viewContext
//        let request =  NSFetchRequest<NSManagedObject>(entityName: "Expense")
//
//        do {
//            try item = managedContext.fetch(request)
//        } catch  {
//            print(error)
//        }
//    }
    @IBAction func Save(_ sender: Any) {
        if describe.text != "" && amount.text != ""{
        
        describe.layer.borderWidth = 0
        amount.layer.borderWidth = 0
        
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Expense", in: managedContext)!
        let expense = NSManagedObject(entity: entity, insertInto: managedContext)
        
        expense.setValue(describe.text, forKeyPath: "descrip")
        expense.setValue(amount.text, forKeyPath: "amount")
        expense.setValue(isCredit , forKeyPath: "expenseType")
    }
        
}
    @IBAction func `switch`(_ sender: UISwitch) {
        isCredit = sender.isOn
        print(sender.isOn)
    }
    

}
