//
//  ShowDetialsViewController.swift
//  Movie Api demo
//
//  Created by admin on 23/12/2021.
//

import UIKit

class ShowDetailsViewController: UIViewController {


    @IBOutlet weak var first: UILabel!
    
    @IBOutlet weak var second: UILabel!
    
    
    @IBOutlet weak var third: UILabel!
    
    @IBOutlet weak var fourth: UILabel!
    
    @IBOutlet weak var fifth: UILabel!
    
    
  //  var movie : Moviesinfo?
    var moviedet : Moviedetail?
    var oneperson : Personinfo?
    
//    var movie : Moviesinfo?
    //    var oneperson : PeopleCharachter
    override func viewDidLoad() {
        var x : String?
        
        super.viewDidLoad()
      if moviedet != nil
        {//Title, Release Date, Director, Opening Crawl
          first.text = moviedet?.title
          second.text = moviedet?.release_date
          third.text = moviedet?.director
          fourth.text = moviedet?.producer
            
        }
        else if oneperson != nil
        {//Name, Gender, Birth Year, Mass
            first.text = oneperson?.name
            second.text = oneperson?.gender
            third.text = oneperson?.birth_year
            fourth.text = oneperson?.mass
            let number = oneperson?.species.count ?? 0
          
                //   for i in 0 ... number
          //  {x = String("\(x), \(oneperson?.species[i])")

            if (number != 0 ){
                fifth.text = oneperson?.species[0]}
        }
        // Do any additional setup after loading the view.
    }
    

  


}
