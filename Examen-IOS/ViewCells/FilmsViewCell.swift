//
//  FilmsViewCell.swift
//  Examen-IOS
//
//  Created by Mañanas on 24/9/24.
//

import UIKit

class FilmsViewCell: UITableViewCell {
    
    @IBOutlet weak var FilmImage: UIImageView!
    @IBOutlet weak var NameFilm: UILabel!
    @IBOutlet weak var YearFilm: UILabel!
    
    override func awakeFromNib() {
            super.awakeFromNib()
            // Initialization code
        }

        func render(_ movie: Movie) {
            NameFilm.text = movie.title
            YearFilm.text = movie.year
            
            // Verificar la URL de la imagen antes de cargarla
            print("Cargando imagen desde URL: \(movie.poster)")
            FilmImage.loadFrom(url: movie.poster)
        }
        
        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)
            // Configure the view for the selected state
        }
    }
