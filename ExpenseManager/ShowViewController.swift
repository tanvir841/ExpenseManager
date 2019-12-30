//
//  ShowViewController.swift
//  ExpenseManager
//
//  Created by Tanvir on 12/30/19.
//  Copyright © 2019 tanvir841. All rights reserved.
//

import UIKit
import CoreData

class ShowViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
    var item: [NSManagedObject] = []
    
    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
              let appDelegate = UIApplication.shared.delegate as! AppDelegate
                let managedContext = appDelegate.persistentContainer.viewContext
           let request =  NSFetchRequest<NSManagedObject>(entityName: "Expense")
    
            do {
                try item = managedContext.fetch(request)
            } catch  {
                print(error)
                
            }
        tableView.reloadData()
        }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return item.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cells = tableView.dequeueReusableCell(withIdentifier: "cell") as! ShowTableViewCell
        let items = item[indexPath.row]
        let expenseLabel = (items.value(forKey: "Descrip") as! String)
         let expenseAmount = items.value(forKey: "amount") as! String
    
        cells.amount.text = expenseLabel
        cells.amount.text = expenseAmount
        return cells
    }

}
