import Foundation

struct WeatherModel{
    
    let city_name: String
    let state: Int
    let celsius: Double
    
    var fahrenheit: Double{
        return celsius * 1.8 + 32.00
    }
    
    let rainfall_probability: Int

   
    var weatherCondition: String{
        
        switch state{
        case 10:
            return "sunny"
        case 11:
            return "cloudy"
        case 12:
            return "rainy"
        case 13:
            return "snowy"
        default:
            return "sunny"
        }
    }
 
}
