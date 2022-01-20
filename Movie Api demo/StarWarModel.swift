//
//  StarWarModel.swift
//  Movie Api demo
//
//  Created by admin on 22/12/2021.
//

import Foundation

class StarWarsModel {
    
    
   class func getData(urlpath: String , completionHandler: @escaping ( Data?,  Error?)-> Void) {
            let urlSession = URLSession.shared
            guard let url = URL.init(string: urlpath) else { return }
    
            print("1. before api call")
            let task = urlSession.dataTask(with: url) { data, response, error in
                print("2. during an api call")
                if error != nil {
                    print("error: \(String(describing: error?.localizedDescription))")
                    completionHandler(nil, error) //
                } else {
//                    if let data = data {
//                        let obj = StarWarsModel().parseLogic(data: data)
                        completionHandler(data,nil)
//                    }
                    // variable (data ) its optional must be unwrapped either force wrapping or binding or guard
                }
            }
       
          task.resume()
       print("After Api Call")
    
   }


    
    
//    private func parseLogic(data:Data) -> Any? {
//        do {
//            let Moviesarr = try JSONDecoder().decode(Moviesinfo.self, from: data) // using codable protocol
//            
//         //  return try JSONSerialization.jsonObject(with: data, options: [])
//            
//        } catch {
//            print( error.localizedDescription)
//           return error
//        }
//    }
    
 
}
