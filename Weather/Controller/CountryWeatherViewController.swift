
import UIKit

class CountryWeatherViewController: UIViewController {
    
    var viewControllerTitle: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()


    }
    


}



extension CountryWeatherViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    

}
