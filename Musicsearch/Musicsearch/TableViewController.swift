//
//  TableViewController.swift
//  Musicsearch
//
//  Created by Park Vladislav on 09.01.2023.
//

import UIKit
import SVProgressHUD
import Alamofire
import SwiftyJSON
import SDWebImage

class TableViewController: UITableViewController, UISearchBarDelegate{
 
    @IBOutlet weak var searchbar: UISearchBar!
    var arrayMusic: [Song] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        searchbar.delegate = self
        
        searchMusic(term: "The Limba")
    }
    func searchMusic(term:String) {
        let parametrs = ["term" : term, "limit" : 25] as [String: Any]
        
        SVProgressHUD.show()
        
        AF.request("https://itunes.apple.com/search", method: .get, parameters: parametrs).responseData {response in
            SVProgressHUD.dismiss()
            
            var resultString = ""
            if let data = response.data {
                resultString = String(data: data, encoding: .utf8)!
                print (resultString)
            }
            if response.response?.statusCode == 200 {
                let json = JSON(response.data!)
                if let array = json["results"].array {
                    for item in array {
                        let music = Song(json: item)
                        self.arrayMusic.append(music)
                    }
                }
            }
            self.tableView.reloadData()
        }
        
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        arrayMusic.removeAll()
        tableView.reloadData()
        searchMusic(term: searchBar.text!)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayMusic.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell

        // Configure the cell...
        cell.setData(music: arrayMusic[indexPath.row])
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 136
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var vc = storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        vc.music = arrayMusic[indexPath.row]
        navigationController?.show(vc, sender: self)
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
