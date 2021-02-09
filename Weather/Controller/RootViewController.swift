import UIKit

class RootViewController: UIViewController {
   
    @IBOutlet weak var countryTableView: UITableView!
    
    var selectedCountry: String = ""
    
    var weatherManager = WeatherManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countryTableView.delegate = self
        countryTableView.dataSource = self
       
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == Constants.Segues.rootToDetailSegue{
            
            let countryWeatherVC = segue.destination as! CountryWeatherViewController
            countryWeatherVC.weatherModel = weatherManager.weatherModel
            
        }
    }

}

//MARK: - UITableViewDelegate, UITableViewDataSource

extension RootViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherManager.countryName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = countryTableView.dequeueReusableCell(withIdentifier: Constants.CellNames.cellIdentifierForCountry, for: indexPath)
        cell.imageView?.image = weatherManager.countryImage[indexPath.row]
        cell.textLabel?.text = weatherManager.countryName[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedCountry = weatherManager.countryName[indexPath.row]
        weatherManager.setCountryName(selectedCountry: selectedCountry)
        weatherManager.parseJSON(for: weatherManager.selectedCountryName)
         
        performSegue(withIdentifier: Constants.Segues.rootToDetailSegue, sender: self)
        
        
        
    }
    
    
}



