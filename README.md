# XCalender
`XCalendar` is a  **swift package** for **calender view** to an iOS application. `XCalendar` supports from **iOS 13** version. This library has the functionality to navigate between months and selection of dates from the calendar. 

### Usage
```

import UIKit
import XCalender

class ViewController: UIViewController {
    @IBOutlet weak var calenderView: XCalenderView?
    @IBOutlet weak var selectedMonth: UILabel?
    
    var month = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        calenderView?.dalegate = self
        self.calenderView?.getMonth(by: month)

        // Do any additional setup after loading the view.
    }
    
    @IBAction func nextPrevAction(sender: UIButton) {
        if sender.tag == 0 { 
        //for prevous month dates
            month -= 1
        } else { 
        //for next month dates
            month += 1
        }
        self.calenderView?.getMonth(by: month)
    }
}


extension ViewController: XCalenderDelegate {
    func didSelected(date: Date) {
        self.selectedMonth?.text = date.string(with: "dd MMM yyyy")
    }
}
```
### Preview
[![XCalender Preview](data:image/jpeg;base64,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)](https://youtu.be/SASlw7Lqz20)



 -I'm welcoming the community to make changes to this library. Anyone can raise pullrequest so that we can extend the functionality together.

## Follow me on social account!
*   [Email](damodar.namala@gmail.com)
*   [Facebook]( https://www.facebook.com/namala.damu)
*   [Twitter](https://twitter.com/NamalaDamodar)
*   [LinkedIn](https://www.linkedin.com/in/damodarnamala/)
