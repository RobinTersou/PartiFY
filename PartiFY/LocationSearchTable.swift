//
//  LocationSearchTable.swift
//  PartiFY
//
//  Created by Robin Tersou on 25/06/2019.
//  Copyright © 2019 Robin Tersou. All rights reserved.
//

import UIKit

class LocationSearchTable : UITableViewController {
    var apiManager:ApiManager = ApiManager(key: "key")
    var parties:[Any] = []
}

extension LocationSearchTable : UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        print("yo");
        if( apiManager.request(type: "GET", route: "home") ) {
        
            //print(Singleton.sharedInstance.firstArray)
            parties = [Singleton.sharedInstance.firstArray]
    
        } else {
            print("ERROR: can't access api");
        }
    }
    
    
}

extension LocationSearchTable {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(parties.count)
        return parties.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        if( parties.count != 0) {
            print(parties[indexPath.item])
            //let selectedItem = parties[indexPath.item]
            //cell.textLabel?.text = selectedItem
        }
        //cell.detailTextLabel?.text = parseAddress(selectedItem: selectedItem)
        return cell
    }
}
