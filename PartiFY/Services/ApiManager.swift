//
//  ApiManager.swift
//  PartiFY
//
//  Created by Robin Tersou on 25/06/2019.
//  Copyright © 2019 Robin Tersou. All rights reserved.
//

import Foundation

class ApiManager {
    var url:String = ""
    var login:String = ""
    var pwd:String = ""
    
    
    init(key:String) {
        getAPIConf();
    }
    
    func request(type:String, route:String) -> Bool {
        let session = URLSession.shared
        let url_session = URL(string: url + route)
        print(url + route)
        /*
        if( !handleRequest(session: session, route: url_session, type: type) ) {
            return false;
        }
        */
        
        switch(type) {
            case "GET" :
                if( !handleGetRequest(session: session, route: url_session) ) {
                    return false;
                }
                break;
            case "POST" :
                if( !handlePostRequest(session: session, route: url_session) ) {
                    return false;
                }
                break;
            case "DELETE" :
                if( !handleDeleteRequest(session: session, route: url_session) ) {
                    return false;
                }
                break;
            case "PUT" :
                if( !handlePutRequest(session: session, route: url_session) ) {
                    return false;
                }
                break;
            default:
                print("ERROR : Bad request type");
        }
        return true;
    }
    /*
    func handleRequest(session:URLSession, route:URL!, type:String) -> Bool {
        
    }
    */
    func handleGetRequest(session:URLSession, route:URL!) -> Bool {
        
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
                print("Json")
                print(json)
                Singleton.sharedInstance.firstArray = json;
            } catch {
                print("JSON error: \(error.localizedDescription)")
            }
        }
        task.resume()
        return true;
    }
    
    func handlePostRequest(session:URLSession, route:URL!) -> Bool {
        
        return true;
    }
    
    func handleDeleteRequest(session:URLSession, route:URL!) -> Bool {
        
        return true;
    }

    func handlePutRequest(session:URLSession, route:URL!) -> Bool {
        
        return true;
    }

    
    func getAPIConf() {
        url = "http://35.210.195.106:8080/j2eapp/";
    }
}
