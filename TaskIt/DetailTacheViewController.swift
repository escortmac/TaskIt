//
//  DetailTacheViewController.swift
//  TaskIt
//
//  Created by PHILIPPE PESCATORE 2 on 27/03/2015.
//  Copyright (c) 2015 iAtelier. All rights reserved.
//

import UIKit

class DetailTacheViewController: UIViewController {

    var modeleDetailTache:TachesModele!
    var controleurPrincipal:ViewController!

    @IBOutlet weak var champTache: UITextField!
    @IBOutlet weak var champSousTache: UITextField!
    @IBOutlet weak var rouleauDate: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.champTache.text = modeleDetailTache.tache
        self.champSousTache.text = modeleDetailTache.sousTache
        self.rouleauDate.date = modeleDetailTache.date
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        if segue.identifier == "montrerLeDetailDeLaTache" {
//            let  detailVC : DetailTacheViewController = segue.destinationViewController as DetailTacheViewController
// 
//            let indexPath = self.tableView.indexPathForSelectedRow()
//            
//        }
//
//    }

    @IBAction func boutonAnnuler(sender: UIBarButtonItem) {
        
        self.navigationController?.popViewControllerAnimated(true)
    }
    @IBAction func boutonOK(sender: UIBarButtonItem) {
        
        var tache = TachesModele(tache: champTache.text, sousTache: champSousTache.text, date: rouleauDate.date)
        controleurPrincipal.dictionnaireTaches[controleurPrincipal.tableView.indexPathForSelectedRow()!.row] = tache
        
        self.navigationController?.popViewControllerAnimated(true)
    }

}
