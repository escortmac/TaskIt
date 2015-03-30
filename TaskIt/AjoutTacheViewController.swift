//
//  AjoutTacheViewController.swift
//  TaskIt
//
//  Created by PHILIPPE PESCATORE 2 on 27/03/2015.
//  Copyright (c) 2015 iAtelier. All rights reserved.
//

import UIKit

class AjoutTacheViewController: UIViewController {
   
    var controleurPrincipal : ViewController!
    
    @IBOutlet weak var champTache: UITextField!
    @IBOutlet weak var champSousTache: UITextField!
    @IBOutlet weak var rouleauDateTache: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func boutonAnnuler(sender: UIButton) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func boutonAjouterUneTache(sender: UIButton) {
        var tache = TachesModele(tache: champTache.text, sousTache: champSousTache.text, date: rouleauDateTache.date)
        controleurPrincipal.dictionnaireTaches.append(tache)
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
