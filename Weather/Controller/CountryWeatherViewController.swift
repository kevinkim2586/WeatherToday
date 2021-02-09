import UIKit

class CountryWeatherViewController: UIViewController {

    @IBOutlet weak var cityTableView: UITableView!
    
    var viewControllerTitle: String = ""
    var weatherModel: [WeatherModel] = []
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cityTableView.delegate = self
        cityTableView.dataSource = self
        
        title = viewControllerTitle
        cityTableView.reloadData()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        cityTableView.reloadData()
        title = viewControllerTitle
        
    }
}




//MARK: - UITableViewDelegate, UITableViewDataSource

extension CountryWeatherViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        return weatherModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let weather: WeatherModel = weatherModel[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.CellNames.cellIdentifierForCity, for: indexPath) as! CityWeatherTableViewCell
    
        cell.cityWeatherImageView.image = UIImage(systemName: weather.weatherCondition)
        cell.cityNameLabel.text = weather.city_name
        cell.cityTemperatureLabel.text = weather.city_name
        cell.cityPrecipitationLabel.text = String(format: "%.0f",weather.rainfall_probability) + "%"
        
        return cell 
    }
    

}
