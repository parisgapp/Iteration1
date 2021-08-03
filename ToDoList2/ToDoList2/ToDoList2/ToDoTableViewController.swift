//
//  ToDoTableViewController.swift
//  ToDoList2
//
//  Created by Paris Gapp on 8/2/21.
//

import UIKit

class ToDoTableViewController: UITableViewController {

    func createToDo() -> [ToDoClass] {

        
        
         let swiftToDo = ToDoClass()
         swiftToDo.description = "Learn Swift"
         swiftToDo.important = true

         let dogToDo = ToDoClass()
         dogToDo.description = "Walk the Dog"
         // important is set to false by default

         return [swiftToDo, dogToDo]
    }

    var listOfToDo : [ToDoClass] = []
    
    override func viewDidLoad() {
      super.viewDidLoad()

      listOfToDo = createToDo()
    }

    

    // MARK: - Table view data source



override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return listOfToDo.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        let eachToDo = listOfToDo[indexPath.row]
        if eachToDo.important {
            cell.textLabel?.text = "❗️" + eachToDo.description
          } else {
        cell.textLabel?.text = eachToDo.description
          }
        
          return cell
        }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

         // this gives us a single ToDo
         let eachToDo = listOfToDo[indexPath.row]

         performSegue(withIdentifier: "moveToCompletedToDoVC", sender: eachToDo)
    }


        // Configure the cell...

    
    

   

   




// In a storyboard-based application, you will often want to do a little preparation before navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let nextAddToDoVC = segue.destination as? AddToDoViewController {
                  nextAddToDoVC.previousToDoTVC = self
             }
        
        if let nextCompletedToDoVC = segue.destination as? CompletedToDoViewController {
                  if let choosenToDo = sender as? ToDoClass {
                       nextCompletedToDoVC.selectedToDo = choosenToDo
                       nextCompletedToDoVC.previousToDoTVC = self
                  }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }


        
}
}
