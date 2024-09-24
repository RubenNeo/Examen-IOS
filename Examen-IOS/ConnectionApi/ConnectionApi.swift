//
//  ConnectionApi.swift
//  Examen-IOS
//
//  Created by Mañanas on 24/9/24.
//

import Foundation

class ConnectionApi {
    let apiKey = "d356f65a"
    
    static func searchFilm(_ title: String, withResult: @escaping ([Movie]) -> Void) {
        let apiKey = "d356f65a"
        let urlString = "https://www.omdbapi.com/?s=\(title)&apikey=\(apiKey)"
        print(urlString)
        
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                // Manejo de errores
                print("Error: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else {
                print("No se recibe nada")
                return
            }
            
            do {
               
                let result = try JSONDecoder().decode(MovieSearchResponse.self, from: data)
                
              
                withResult(result.search)
                
            } catch {
                print("Error JSON \(error.localizedDescription)")
            }
        }
        task.resume()
    }
}
