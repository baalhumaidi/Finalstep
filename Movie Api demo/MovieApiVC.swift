//
//  PeopleAPiDemoTableViewController.swift
//  Movie Api demo
//
//  Created by admin on 22/12/2021.
//

import UIKit

class MovieApiVC: UITableViewController {
    
    
    let MovieApi = "https://swapi.dev/api/films/?format=json"
    let identifier = "MovieCell"
    
    var MoviesArr: Moviesinfo?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        getMovieApi()

    }
    
    func getMovieApi() {
        StarWarsModel.getData(urlpath: MovieApi) { responseobj, error in
            if error != nil{
                print(error?.localizedDescription)
                
            }
            else {
                if let data = responseobj,
                   let Movies = self.parseLogic(data: data){
                    self.MoviesArr = Movies
                }

                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            }
        }
    }
    
    
    func parseLogic(data: Data) -> Moviesinfo? {
        do {
            let Moviesarr = try JSONDecoder().decode(Moviesinfo.self, from: data) // using codable protocol
            print(Moviesarr.results.first?.title)
            return Moviesarr
            //  return try JSONSerialization.jsonObject(with: data, options: [])
            
        } catch {
            print( error.localizedDescription)
            return nil
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows

        return MoviesArr?.results.count ?? 0
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        
        
        cell.textLabel?.text = MoviesArr?.results[indexPath.row].title

        
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let nextpage = storyboard?.instantiateViewController(withIdentifier: "ShowDetialsViewController") as! ShowDetailsViewController
        nextpage.moviedet = MoviesArr?.results[indexPath.row]
        
        navigationController?.pushViewController(nextpage, animated: true)

        
    }


    
}
   
    // MARK: - Result
   
    //
    //        let episode_id: Int
    //        init?(dict:[String: Any]){
    //            guard let title = dict["title"] as? String,  // Important
    //                  let episode_id = dict["episode_id"] as? Int,
    //                  let release_date = dict["release_date"] as? String,
    //                  let opening_crawl = dict["opening_crawl"] as? String,
    //                  let producer = dict["producer"] as? String,
    //                  let director = dict["director"] as? String
    //
    //            else {
    //                print("parsing failed")
    //                return nil
    //            }
    //            self.title  = title
    //            self.episode_id = episode_id
    //            self.release_date = release_date
    //            self.opening_crawl = opening_crawl
    //            self.director = director
    //            self.producer = producer
    //
    //
    //        }
    //    }
    
    
    




//    func parseMovieApi(dict : [String:Any]) {
//        guard let title = dict["title"] as? String, // Important
//                let episodeID = dict["episode_id"] as? Int
////              let birthYear = dict["birth_year"] as? String,
////              let films = dict["films"] as? [String],
////              let species = dict["species"] as? [String]
//        else {
//                  print("parsing failed")
//                  return
//              }



//  }
/*
 let urlSession = URLSession.shared
 guard let peopleURL = URL.init(string: MovieApi) else { return }
 
 print("1. before api call")
 let task = urlSession.dataTask(with: peopleURL) { data, response, error in
 print("2. during an api call")
 if error != nil {
 print("error: \(String(describing: error?.localizedDescription))")
 } else {
 self.parseLogic(data: data!)
 }
 }
 
 task.resume()
 
 print("3. after api call")
 }
 
 func parseLogic(data:Data) {
 do {
 let dict = try JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
 //print(dict)
 if let results = dict["results"] as? [[String:Any]]   { // Important
 for result in results {
 parseMovieApi(dict: result)
 DispatchQueue.main.async {
 self.tableView.reloadData()
 }
 }
 }
 } catch {
 print( error.localizedDescription)
 }
 }
 
 func parseMovieApi(dict : [String:Any]) {
 guard let title = dict["title"] as? String, // Important
 let episodeID = dict["episode_id"] as? Int
 //              let birthYear = dict["birth_year"] as? String,
 //              let films = dict["films"] as? [String],
 //              let species = dict["species"] as? [String]
 else {
 print("parsing failed")
 return
 }
 let movie = Moviesinfo.init(title: title, episodeID: episodeID)
 MoviesArr.append(movie)
 
 print(MoviesArr)
 
 
 }
 */

// MARK: - Table view data source


