import UIKit

class CityViewController: UIViewController {
    
    @IBOutlet weak var cityWeatherImageView: UIImageView!
    @IBOutlet weak var cityWeatherConditionLabel: UILabel!
    @IBOutlet weak var cityTemperatureLabel: UILabel!
    @IBOutlet weak var cityPrecipitationLabel: UILabel!
    
    var weatherImage: UIImage?
    var weatherCondition: String?
    
    var celsius: Double?
    var fahrenheit: Double?
    
    var precipitation: Int?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

     
    }
    



}
