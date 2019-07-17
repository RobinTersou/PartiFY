//
//  TicketController.swift
//  PartiFY
//
//  Created by Robin Tersou on 26/06/2019.
//  Copyright © 2019 Robin Tersou. All rights reserved.
//

import UIKit

class TicketController: UIViewController, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    
    var tickets: [Any] = ["Possession", "Razance", "Entente Nocturne"]
    
    let url = "http://35.210.195.106:8080/j2eapp/";
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tickets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let ticket = tickets[indexPath.row]
        
        cell.textLabel?.text = ticket as? String
        cell.detailTextLabel?.text = ticket as? String
        
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    func loadData() {
        let route = URL(string:url+"home")!
        let session = URLSession.shared
        
        let task = session.dataTask(with: route) { data, response, error in
            if error != nil || data == nil {
                print("Client error!")
                return
            }
            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                print("Server error!")
                return
            }
            guard let mime = response.mimeType, mime == "application/json" else {
                print("Wrong MIME type!")
                return
            }
            
            
            
            do {
                //let json = try JSONSerialization.jsonObject(with: data!, options: [])
                print(data!)
                let json2 = try JSONDecoder().decode(Party.self, from: data!)
                
                print(json2)
                    /*
                    for (key, value) in ticket {
                        print(key)
                        print(value.links?.selfStr)
                        print(value.links?.related)
                    }*/
                
                
                //self.tickets = [json]
                
            } catch {
                print("JSON error: \(error.localizedDescription)")
            }
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        task.resume()
    }
    
    
    /*
    //@IBOutlet weak var tableView: UITableView!
    //var tableView:UITableView?
    
    let url = "http://35.210.195.106:8080/j2eapp/";
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.backgroundColor = UIColor.white
        print(tickets[indexPath.row]);
        cell.textLabel?.text = tickets[indexPath.row] as? String
        return cell
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData();
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadData() {
        let route = URL(string:url+"home")!
        let session = URLSession.shared
        
        let task = session.dataTask(with: route) { data, response, error in
                if error != nil || data == nil {
                    print("Client error!")
                    return
                }
                guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                    print("Server error!")
                    return
                }
                guard let mime = response.mimeType, mime == "application/json" else {
                    print("Wrong MIME type!")
                    return
                }
            
                do {
                    let json = try JSONSerialization.jsonObject(with: data!, options: [])
                    self.tickets = [json]
                    print("Json")
                    print(json)
                    print("ticket")
                    print(self.tickets)
                    
                } catch {
                    print("JSON error: \(error.localizedDescription)")
                }
            
                DispatchQueue.main.async {
                    print("yoaaaaa")
                    self.tableView.reloadData()
                }
            }
            task.resume()
        }
        */
}
