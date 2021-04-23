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

       
       do{
           
        try managedContext.save()
        print("add")
       }catch let _ as NSError{
           
           print("error")
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

                
                let fav=Favourit(idLeague: i.value(forKey: "idLeague") as! String, strBadge: i.value(forKey: "strBadge") as! String, strSport: i.value(forKey: "strSport") as! String, strLeague: i.value(forKey: "strLeague") as! String, strYoutube: i.value(forKey: "strYoutube") as! String)
                   
                  arr.append(fav)
                  
                  
                }
               }
            }catch let error as NSError{
                   print(error)
           }
    return arr
}
    
}
