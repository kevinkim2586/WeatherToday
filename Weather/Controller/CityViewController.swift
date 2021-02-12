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
    
    var viewControllerTitle: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = viewControllerTitle
        showWeatherInformation()
        
    }
    
    func showWeatherInformation(){
        
        cityWeatherImageView.image = weatherImage
        cityWeatherConditionLabel.text = weatherCondition
        
        if let celsiusTemp = celsius, let fahrenheitTemp = fahrenheit, let precipitationRate = precipitation{
            
            cityTemperatureLabel.text = "섭씨 " + String(format: "%.1f",celsiusTemp) + "도 / 화씨 " + String(format: "%.1f",fahrenheitTemp) + "도"
            cityPrecipitationLabel.text = "강수확률 " + String(format: "%d",precipitationRate) + "%"
        }
    }
}
