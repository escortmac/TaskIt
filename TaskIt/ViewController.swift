//
//  ViewController.swift
//  TaskIt
//
//  Created by PHILIPPE PESCATORE 2 on 25/03/2015.
//  Copyright (c) 2015 iAtelier. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var dictionnaireTaches : [TachesModele] = []
    var modeleDetailTache : TachesModele!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let date1 = Date.de(annee: 2014, mois: 05, jour: 20)
        let date2 = Date.de(annee: 2014, mois: 03, jour: 3)
        let date3 = Date.de(annee: 2014, mois: 12, jour: 13)
        
        
        let tache1 = TachesModele(tache: "Etudes De Français", sousTache: "Verbes", date: date1)
        let tache2 = TachesModele(tache: "Diner", sousTache: "Hamburgers", date: date2)
        let tache3 = TachesModele(tache: "Gym", sousTache: "Jambes ce jour", date: date3)
        dictionnaireTaches = [tache1, tache2, tache3]
        
        self.tableView.reloadData() // rafraichir les données
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        
        func triParDate (tache1:TachesModele, tache2: TachesModele) -> Bool {
            return tache1.date.timeIntervalSince1970 < tache2.date.timeIntervalSince1970
        }
        dictionnaireTaches=dictionnaireTaches.sorted(triParDate)
        
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
                    if segue.identifier == "montrerLeDetailDeLaTache" {
                        let detailVC : DetailTacheViewController = segue.destinationViewController as DetailTacheViewController
                        let indexPath = self.tableView.indexPathForSelectedRow()
                        let cetteTache = dictionnaireTaches[indexPath!.row]
                        detailVC.modeleDetailTache = cetteTache
                        detailVC.controleurPrincipal = self
                    } else if segue.identifier == "montrerAjoutTache" {
                        let ajoutTacheVC:AjoutTacheViewController = segue.destinationViewController as AjoutTacheViewController
                        ajoutTacheVC.controleurPrincipal = self
        }
        
        
    }
    
    
    @IBAction func boutonAjouterTache(sender: UIBarButtonItem) {
        
        self.performSegueWithIdentifier("montrerAjoutTache", sender: self)
    }
    
    
    
    //fonctions du protocole UItableViewDataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dictionnaireTaches.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        println(indexPath.row)
        
        let tache = dictionnaireTaches[indexPath.row]
        
        var cell : TachesCell = tableView.dequeueReusableCellWithIdentifier("maCellule") as TachesCell
        
        cell.etiquetteTache.text = tache.tache
        cell.etiquetteSousTache.text = tache.sousTache
        cell.etiquetteDate.text = Date.versChaine(date: tache.date)
        
        
        return cell
    }
    
    // fonctions du protocole UITableViewDelegate
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println(indexPath.row)
        performSegueWithIdentifier("montrerLeDetailDeLaTache", sender: self)
    }
    
    //fonctions d'assistance

}

