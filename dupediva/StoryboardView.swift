//
//  StoryboardView.swift
//  dupediva
//
//  Created by Rhea Modey on 4/11/24.
//

import Foundation
import UIKit


class StoryboardView: UIViewController, DetailView {
    
    var presenter: MovieDetailPresenter!
    var movie: Movie?
    
    @IBOutlet weak var lblMovieYear: UILabel!
    @IBOutlet weak var lblMovieTitle: UILabel!
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var lblMovieRating: UILabel!
    @IBOutlet weak var lblMovieOverview: UILabel!
}
