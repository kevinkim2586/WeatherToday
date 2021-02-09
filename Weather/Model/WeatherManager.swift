import UIKit

struct WeatherManager{
    
    let countryName: [String] = ["한국", "독일", "이탈리아", "미국", "프랑스", "일본"]
    let countryImage: [UIImage] = [#imageLiteral(resourceName: "flag_kr"), #imageLiteral(resourceName: "flag_de"), #imageLiteral(resourceName: "flag_it"), #imageLiteral(resourceName: "flag_us"), #imageLiteral(resourceName: "flag_fr"), #imageLiteral(resourceName: "flag_jp")]
    
    var decodedWeatherData: [WeatherData] = []
    var weatherModel: [WeatherModel] = []
    
    var selectedCountryName: String = ""
    
    mutating func setCountryName(selectedCountry: String){
        
        switch selectedCountry {
        case "한국":
            selectedCountryName = "kr"
        case "독일":
            selectedCountryName = "de"
        case "이탈리아":
            selectedCountryName = "it"
        case "미국":
            selectedCountryName = "us"
        case "프랑스":
            selectedCountryName = "fr"
        case "일본":
            selectedCountryName = "jp"
        default:
            selectedCountryName = "kr"
        }
    }
    
    mutating func parseJSON(for country: String){
        
        let decoder = JSONDecoder()
        
        guard let dataAsset: NSDataAsset = NSDataAsset(name: country) else{
            return
        }
        
        do{
            self.decodedWeatherData = try decoder.decode([WeatherData].self, from: dataAsset.data)
            
            convertToWeatherModel(from: decodedWeatherData)

        }catch{
            print("There was an error parsing JSON Data")
            return
        }
    }
    
    mutating func convertToWeatherModel(from decodedData: [WeatherData]){
        
        for decodedData in decodedWeatherData{
            
            let cityName = decodedData.city_name
            let state = decodedData.state
            let celsius = decodedData.celsius
            let rainfall = decodedData.rainfall_probability
            
            weatherModel.append(WeatherModel(city_name: cityName, state: state, celsius: celsius, rainfall_probability: rainfall))
        }
    }
    

    
}
