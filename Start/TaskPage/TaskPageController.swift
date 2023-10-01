import UIKit
import SnapKit
import RealmSwift

class TaskPageController: UIViewController {
    
    //MARK: - Constant
    private let realm = try! Realm()
    
    
    //MARK: - UI Components
    public var item: TaskItem?
    public var deletionHandler: (() -> Void)?
    private var taskTitle = UILabel()
    private let deleteButton = UIButton()
    private let goBackButton = UIButton()
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        deleteButton.addTarget(self, action: #selector(deleteTask), for: .touchUpInside)
        goBackButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        UISetup()
    }
    
    //MARK: - UI Setup
    private func UISetup(){
        view.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        view.addSubview(taskTitle)
        view.addSubview(deleteButton)
        view.addSubview(goBackButton)
        
        taskTitle.text = item?.name
        taskTitle.numberOfLines = 0
        taskTitle.font = UIFont.boldSystemFont(ofSize: 20)
        taskTitle.snp.makeConstraints{maker in
            maker.top.equalTo(goBackButton).inset(60)
            maker.left.equalToSuperview().inset(20)
            maker.right.equalToSuperview().inset(20)
        }
        
        deleteButton.setTitle("Delete task", for: .normal)
        deleteButton.setTitleColor(.systemRed, for: .normal)
        deleteButton.snp.makeConstraints{maker in
            maker.top.equalToSuperview().inset(60)
            maker.right.equalToSuperview().inset(20)}
        
        goBackButton.setTitle("Go Back", for: .normal)
        goBackButton.setTitleColor(.systemBlue, for: .normal)
        goBackButton.snp.makeConstraints{maker in
            maker.top.equalToSuperview().inset(60)
            maker.left.equalToSuperview().inset(20)}
    }
    
    //MARK: - Selectors
    @objc func deleteTask(){
        realm.beginWrite()
        
        guard let myItem = self.item else { return  };
        
        realm.delete(myItem)
        
        try! realm.commitWrite()
        
        deletionHandler?()
        navigationController?.popViewController(animated: true)
    }
    
    @objc func goBack(){
        _ = navigationController?.popViewController(animated: true)
    }
    

}
