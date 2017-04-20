//
//  ViewController.swift
//  MisRecetas
//
//  Created by Cristian Fernández on 17/03/2017.
//  Copyright © 2017 Cristian Fernández. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var recipes : [Recipe] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Opciones texto
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        //Ocultar barra
        navigationController?.hidesBarsOnSwipe = true
        
        
        // Do any additional setup after loading the view, typically from a nib.
        
        let inset : UIEdgeInsets = UIEdgeInsetsMake(20, 0, 0, 0)
        self.tableView.contentInset = inset
        
        var recipe = Recipe(name: "Toritlla de patatas", image: #imageLiteral(resourceName: "tortilla"), time: 30, ingredients: ["Patata", "Huevo"], steps: ["Cocinar"])
        recipes.append(recipe)
        recipe = Recipe(name: "Canelones", image: #imageLiteral(resourceName: "canelones"), time: 22, ingredients: ["Pasta", "Huevo"], steps: ["Cocinar"])
        recipes.append(recipe)
        recipe = Recipe(name: "Paella", image: #imageLiteral(resourceName: "paella"), time: 33, ingredients: ["Arroz", "Gambas"], steps: ["Cocinar"])
        recipes.append(recipe)
        recipe = Recipe(name: "Pizza", image: #imageLiteral(resourceName: "pizza"), time: 44, ingredients: ["Masa", "Huevo"], steps: ["Cocinar"])
        recipes.append(recipe)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnSwipe = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: - UITableViewDataSource
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.recipes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let recipe = self.recipes[indexPath.row]
        let cellId = "RecipeCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! RecipeCell
        cell.nameLabel?.text = recipe.name
        cell.timeLabel?.text = String(recipe.time)
        cell.ingredientsLabel?.text = recipe.ingredients[1]
        cell.thumbnailImageView?.image = recipe.image
        
        /*if recipe.isFavourite {
        cell.accessoryType = .checkmark
        }else{
            cell.accessoryType = .none
        }
        */
        //cell.thumbnailImageView.layer.cornerRadius = 49
        //cell.thumbnailImageView.clipsToBounds = true
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            self.recipes.remove(at: indexPath.row)
        }
        
        self.tableView.deleteRows(at: [indexPath], with: .fade)
        
        //self.tableView.reloadData()
        
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let shareAction = UITableViewRowAction(style: .default, title: "Compartir") { (action, indexPath) in
            let shareDefaultText = "Estoy mirando la receta de \(self.recipes[indexPath.row].name) en la App del curso"
            
            let activityController = UIActivityViewController(activityItems: [shareDefaultText, self.recipes[indexPath.row].image!], applicationActivities: nil)
            self.present(activityController, animated: true, completion: nil)
        }
        
        shareAction.backgroundColor = UIColor(red:202.0/255.0, green: 202.0/255.0, blue: 202.0/255.0, alpha: 1.0)
        
        //Borrar
        let deleteAction = UITableViewRowAction(style: .default, title: "Borrar") { (action, indexPath) in
            self.recipes.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
        return [shareAction, deleteAction]
        
    }
    
    //MARK: - UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        /*let recipe = self.recipes[indexPath.row]
        
        let alertController = UIAlertController(title: recipe.name, message:"Valora este plato", preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title:"Cancelar", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        var favouriteActionTitle = "Favorito"
        if recipe.isFavourite {
        favouriteActionTitle="No Favorito"
        }
        
        let favouriteAction = UIAlertAction(title: favouriteActionTitle, style: .default){ (action) in
            let recipe = self.recipes[indexPath.row]
            recipe.isFavourite = !recipe.isFavourite
            self.tableView.reloadData()
        }
        alertController.addAction(favouriteAction)
        self.present(alertController, animated: true, completion: nil)*/
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showRecipeDetail" {
        
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let selectedRecipe = self.recipes[indexPath.row]
                let destinationViewController = segue.destination as! DetailViewController
                destinationViewController.recipe = selectedRecipe
            }
        }
    }
    
    
}

