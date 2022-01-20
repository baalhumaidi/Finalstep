//
//  ViewController.swift
//  Movie Api demo
//

//

import UIKit

class PeopleApiVC: UIViewController {
    
    
    let peopleApi = "https://swapi.py4e.com/api/people/"
    let identifier = "PeopleCell"
    
    @IBOutlet weak var tableView: UITableView!
    var PeopleArr: PeopleCharachter?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        getPeopleApi()
  
    }
    
    func getPeopleApi() {
        StarWarsModel.getData(urlpath: peopleApi) { responseobj, error in
            if error != nil{
                print(error?.localizedDescription)
                
            }
            else {
                if let theresponseobj = responseobj,
                   let personobj = self.parseLogic(data: theresponseobj)
                {
                    self.PeopleArr = personobj}
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
    
            }
        }
    }
    
    
    func parseLogic(data: Data) -> PeopleCharachter? {
        do {
            return try JSONDecoder().decode(PeopleCharachter.self, from: data) // using codable protocol
            // this function return [PeopleArr]
            //  return try JSONSerialization.jsonObject(with: data, options: [])
            
        } catch {
            print( error.localizedDescription)
            return nil
        }
    }
 
}


extension PeopleApiVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.PeopleArr?.results.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        cell.textLabel?.text = PeopleArr?.results[indexPath.row].name
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sendtopage = storyboard?.instantiateViewController(withIdentifier: "ShowDetialsViewController") as! ShowDetailsViewController
        
        sendtopage.oneperson = PeopleArr?.results[indexPath.row]
        print(indexPath.row)
        print (PeopleArr?.results[indexPath.row].name)
        let num = PeopleArr?.results[indexPath.row].species.count ?? 0
        for i in 0 ..< num {
            print(PeopleArr?.results[indexPath.row].species[i])
        }
//        for i in 0..> num
//        {
//
//        }
        navigationController?.pushViewController(sendtopage, animated: true)
    }
    
}

