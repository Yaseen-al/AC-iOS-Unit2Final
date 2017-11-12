//
//  ColorTableViewController.swift
//  AC-iOS-Unit2Final
//
//  Created by C4Q on 11/10/17.
//  Copyright © 2017 Karen Fuentes. All rights reserved.
//

import UIKit

class ColorTableViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var myTableView: UITableView!
        var myCrayons = [Crayon]()
    //Mark TableView: Required methods are the number of rows as well as how it will look like and the setting the delegate and the data source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myCrayons.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let crayonSetup = myCrayons[indexPath.row]
        guard let cell: UITableViewCell = myTableView.dequeueReusableCell(withIdentifier: "myCell") else {
            let defaultCell = UITableViewCell()
            defaultCell.textLabel?.text = crayonSetup.name
            return defaultCell
        }
        cell.textLabel?.text = crayonSetup.name
        cell.detailTextLabel?.text = crayonSetup.hex
        cell.backgroundColor = UIColor(red:CGFloat(crayonSetup.red/255), green: CGFloat(crayonSetup.green/255), blue: CGFloat(crayonSetup.blue/255)
            , alpha: 1.0)
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        if crayonSetup.blue < 140 || crayonSetup.red < 140 || crayonSetup.green < 140 || crayonSetup.hex == "#000000"{
            cell.textLabel?.textColor = UIColor.white
            cell.detailTextLabel?.textColor = UIColor.white
        }
        return cell
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.myCrayons = Crayon.allTheCrayons
        self.myTableView.delegate = self
        self.myTableView.dataSource = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailedColorViewController{
            let crayonSetup = myCrayons[(self.myTableView.indexPathForSelectedRow?.row)!]
            Settings.red = crayonSetup.red
            Settings.green = crayonSetup.green
            Settings.blue = crayonSetup.blue
            Settings.alpha = 1
            destination.crayon = crayonSetup
        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }


}
