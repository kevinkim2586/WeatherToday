import UIKit

class CountryWeatherViewController: UIViewController {

    @IBOutlet weak var cityTableView: UITableView!
    
    var viewControllerTitle: String = ""
    var weatherModel: [WeatherModel] = []
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cityTableView.delegate = self
        cityTableView.dataSource = self
        
        navigationItem.title = viewControllerTitle
        cityTableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        cityTableView.reloadData()
    }
    
    func precipitationIsHigh(probability: Int)->Bool{
        
        if probability >= 50{
            return true
        }
        else { return false }
    }
}


//MARK: - UITableViewDelegate, UITableViewDataSource

extension CountryWeatherViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = Constants.CellNames.cellIdentifierForCity
        
        let weather: WeatherModel = weatherModel[indexPath.row]

        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CityWeatherTableViewCell
    
        cell.cityWeatherImageView.image = UIImage(named: weather.weatherCondition)
        cell.cityNameLabel.text = weather.city_name
        cell.cityTemperatureLabel.text = "섭씨 " + String(format: "%.1f", weather.celsius)
            + "도 / 화씨 " + String(format: "%.1f", weather.fahrenheit) + "도"
        
        
        if precipitationIsHigh(probability: weather.rainfall_probability){
            
            cell.cityPrecipitationLabel.text = "강수확률 " + String(format: "%d",weather.rainfall_probability) + "%"
            cell.cityPrecipitationLabel.textColor = .orange
        }
        else{
            cell.cityPrecipitationLabel.text = "강수확률 " + String(format: "%d",weather.rainfall_probability) + "%"
        }
        
        
        
        
        return cell 
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        guard let cityVC = self.storyboard?.instantiateViewController(identifier: Constants.StoryBoardID.cityVC) as? CityViewController else{
            return
        }
        
        let cityWeather: WeatherModel = weatherModel[indexPath.row]
        
        cityVC.viewControllerTitle = cityWeather.city_name
        
        cityVC.weatherImage = UIImage(named: cityWeather.weatherCondition)
        cityVC.weatherCondition = cityWeather.weatherConditionInKorean
        cityVC.celsius = cityWeather.celsius
        cityVC.fahrenheit = cityWeather.fahrenheit
        cityVC.precipitation = cityWeather.rainfall_probability
        
        navigationController?.pushViewController(cityVC, animated: true)

    }
}
