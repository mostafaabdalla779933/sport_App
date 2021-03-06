//
//  CoreDat.swift
//  sport
//
//  Created by mosatafa abdalla on 4/23/21.
//  Copyright © 2021 mosatafa abdalla. All rights reserved.
//

import Foundation
import CoreData
import UIKit
class CoreDat{
    
    
    func add(country :Favourit){
        
       let appDelegate:AppDelegate=UIApplication.shared.delegate as! AppDelegate
       let managedContext = appDelegate.persistentContainer.viewContext
       let entity=NSEntityDescription.entity(forEntityName: "Fav", in: managedContext)
       
       let count=NSManagedObject(entity: entity!, insertInto: managedContext)
       
        
        count.setValue(country.idLeague, forKey: "idLeague")
        count.setValue(country.strBadge, forKey: "strBadge")
        count.setValue(country.strYoutube, forKey: "strYoutube")
        count.setValue(country.strLeague, forKey: "strLeague")
        count.setValue(country.strSport, forKey: "strSport")
        count.setValue(country.country, forKey: "country")
       
       do{
           
        try managedContext.save()
        print("add")
       }catch let _ as NSError{
           
           print("error")
       }
           
       }
    
    
    func deleteRecords() {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let context = delegate.persistentContainer.viewContext

        let deleteFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Fav")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: deleteFetch)

        do {
            try context.execute(deleteRequest)
            try context.save()
        } catch {
            print ("There was an error")
        }

    }
    
    
    
    func delete(id :String){
        var arr: [Favourit] = []
        get().forEach { (fav) in
            if fav.idLeague == id {
            }else{
                arr.append(fav)
            }
        }
        deleteRecords()
        
        arr.forEach { (fav) in
            add(country: fav)
        }
    }
     
  
    
func get()-> [Favourit]{
   var arr:[Favourit]=[]
   let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
    

   let managedContext = appDelegate.persistentContainer.viewContext
               
          let fetchReq=NSFetchRequest<NSManagedObject>(entityName: "Fav")


          do{
                   
            var favs = try managedContext.fetch(fetchReq)
            if favs != nil {
                    
               for i in favs {

                
                let fav=Favourit(idLeague: i.value(forKey: "idLeague") as! String, strBadge: i.value(forKey: "strBadge") as! String, strSport: i.value(forKey: "strSport") as! String, strLeague: i.value(forKey: "strLeague") as! String, strYoutube: i.value(forKey: "strYoutube") as! String,country: i.value(forKey: "country") as! String)
                   
                  arr.append(fav)
                  
                  
                }
               }
            }catch let error as NSError{
                   print(error)
           }
    return arr
}
    
    
    func getAdd()-> [String]{
       var arr:[String]=[]
       let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        

       let managedContext = appDelegate.persistentContainer.viewContext
                   
              let fetchReq=NSFetchRequest<NSManagedObject>(entityName: "Fav")


              do{
                       
                var favs = try managedContext.fetch(fetchReq)
                if favs != nil {
                        
                   for i in favs {
                    arr.append(i.value(forKey: "idLeague") as! String)
                      
                    }
                   }
                }catch let error as NSError{
                       print(error)
               }
        return arr
    }
    
}
