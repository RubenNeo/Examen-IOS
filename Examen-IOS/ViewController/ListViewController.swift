import UIKit

class ListViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var TableView: UITableView!
    
    var MovieList: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configurar el datasource para la tabla
        TableView.dataSource = self
        
        searchMovies(query: "Blade")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MovieList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Dequeue una celda reutilizable
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! FilmsViewCell
        
        // Obtener el detalle de la película correspondiente al índice
        let movie = MovieList[indexPath.row]
        
        // Configurar la celda con el título de la película
        cell.render(movie)
        
        return cell
    }
    
    func searchMovies(query: String) {
        
        
        // Realizar una búsqueda de la película "Matrix"
        ConnectionApi.searchFilm(query) { movies in
            // Este bloque se ejecuta en el hilo de fondo
            print("Se encontraron \(movies.count) películas para la búsqueda de 'Matrix':")
            
            for movie in movies {
                print("Título: \(movie.title ?? "Sin título"), Año: \(movie.year ?? "Sin año"), ID: \(movie.imdbID ?? "Sin ID")")
            }
            self.MovieList = movies
            DispatchQueue.main.async {
                self.TableView.reloadData()
            }
        }
    }
}
