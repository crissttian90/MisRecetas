//
//  ReviewViewController.swift
//  MisRecetas
//
//  Created by Cristian Fernández on 16/04/2017.
//  Copyright © 2017 Cristian Fernández. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {

    
    @IBOutlet var backgroundImageView: UIImageView!
    
    @IBOutlet var ratingStackView: UIStackView!
    
    @IBOutlet var dislikeButton: UIButton!
    
    @IBOutlet var goodButton: UIButton!
    
    @IBOutlet var greatButton: UIButton!
    
    var ratingSelected : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Difuminado
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        backgroundImageView.addSubview(blurEffectView)
        
        
        let scale = CGAffineTransform(scaleX: 0.0, y: 0.0)
        let translation = CGAffineTransform(translationX: 0.0, y: 500.0)
        
        //Combinados
        //ratingStackView.transform = scale.concatenating(translation)
        dislikeButton.transform = scale.concatenating(translation)
        goodButton.transform = scale.concatenating(translation)
        greatButton.transform = scale.concatenating(translation)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        /*UIView.animate(withDuration: 0.5, delay: 0.2, options: [], animations: {
            self.ratingStackView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }, completion: nil)
        
        UIView.animate(withDuration: 0.5, delay: 0.2, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.5, options: [], animations: {
            self.ratingStackView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }, completion: nil)*/
        
        UIView.animate(withDuration: 0.8, delay: 0.2, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.4, options: [], animations: {
            self.dislikeButton.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }, completion: nil)
        
        UIView.animate(withDuration: 0.6, delay: 0.2, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.6, options: [], animations: {
            self.goodButton.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }, completion: nil)
        
        UIView.animate(withDuration: 0.4, delay: 0.2, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.8, options: [], animations: {
            self.greatButton.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }, completion: nil)
        
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func ratingPressed(_ sender: UIButton) {
        
        switch sender.tag {
        case 1:
            ratingSelected = "dislike"
        case 2:
            ratingSelected = "good"
        case 3:
            ratingSelected = "great"
        default:
            break
        }
        
        performSegue(withIdentifier: "unwindToDetailView", sender: sender)
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
