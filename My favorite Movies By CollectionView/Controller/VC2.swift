import UIKit

class VC2: UIViewController {
    
    var SingleItem:MovieItem?
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lbl: UILabel!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var AllHeight: NSLayoutConstraint!
    
    @IBAction func backbtn(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        img.image = UIImage(named: (SingleItem?.Image)!)
        // img.layer.cornerRadius = 20
        lbl.text = SingleItem?.Name
        textView.text = SingleItem?.Dec
        
            img.layer.cornerRadius = 20
            img.contentMode = .redraw
            img.backgroundColor = UIColor.lightGray
            img.layer.masksToBounds = true

            lbl.textColor = UIColor.black
            lbl.backgroundColor = UIColor(red:0.95, green:0.96, blue:0.99, alpha:1.0)
            lbl.font = UIFont.systemFont(ofSize: 18)
            lbl.textAlignment = .center
            lbl.layer.cornerRadius = 20
            lbl.layer.masksToBounds = true
        
        textView.textColor = UIColor.black
        textView.backgroundColor = UIColor(red:0.95, green:0.96, blue:0.99, alpha:1.0)
        textView.font = UIFont.systemFont(ofSize: 18)
        textView.textAlignment = .center
        textView.layer.cornerRadius = 20
        textView.layer.masksToBounds = true
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let fixedWidth = textView.frame.size.width
        textView.sizeThatFits(CGSize(width: fixedWidth, height:CGFloat.greatestFiniteMagnitude))
        let newSize = textView.sizeThatFits(CGSize(width: fixedWidth , height: CGFloat.greatestFiniteMagnitude))
        var newFrame = textView.frame
        newFrame.size = CGSize(width: max(newSize.width, fixedWidth), height: newSize.height)
        //AllHieght.constant = newFrame.size.height + 224
        view.layoutIfNeeded()
        AllHeight.constant = newFrame.size.height + 224
    }
    
    
    
    
}
