import UIKit

class ViewController: UIViewController {
    
    var MovieList = [MovieItem]()
    @IBOutlet weak var collecionViewList: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        ReedFromPlist()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dis = segue.destination as? VC2
        {
            if let Movie = sender as? MovieItem {
                dis.SingleItem=Movie
                
            }
        }
    }
    func ReedFromPlist() {
        //makan elpath
        let path = Bundle.main.path(forResource: "Movies", ofType: "plist")!
        //begeeb el path beta3 elfile da5el elcomputer
        let url = URL(fileURLWithPath: path)
        //حاول ان تقرأ الداتا الموجودة في الurl
        let data = try! Data(contentsOf: url)
        //تحويل الداتا لبيانات قابلة لللقراءة
        let plist = try! PropertyListSerialization.propertyList(from: data, options: .mutableContainers, format: nil)
        // تحويل البيانات لـ dictionary..تحول البيانات الي array of object
        let dicArray = plist as! [[String:String]]
        //تملأ الarray بالـ items
        for dic in dicArray {
            MovieList.append(MovieItem(Name: dic["Name"]!, Dec: dic["Des"]!, Image: dic["Image"]!))
            
        }
    }
    
}

extension ViewController:UICollectionViewDelegate,UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return MovieList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:CollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.lbl.text = MovieList[indexPath.row].Name!
        cell.img.image = UIImage(named: MovieList[indexPath.row].Image!)
        
        cell.img.layer.cornerRadius = 20.0
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "NextVC", sender: MovieList[indexPath.row])
    }
   
    
}
