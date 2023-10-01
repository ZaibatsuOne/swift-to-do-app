import UIKit
import SnapKit
import RealmSwift

class TaskPageController: UIViewController {
    
    //MARK: - Constant
    private let realm = try! Realm()
    
    
    //MARK: - UI Components
    var item: TaskItem?
    private var deleteionHandler: (() -> Void)?
    private var taskTitle = UILabel()
    private let deleteButton = UIButton()
    private let goBackButton = UIButton()
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        
        UISetup()
    }
    
    //MARK: - UI Setup
    private func UISetup(){
        view.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        view.addSubview(taskTitle)
        view.addSubview(deleteButton)
        view.addSubview(goBackButton)
        
        taskTitle.text = item?.name
        taskTitle.snp.makeConstraints{maker in
            maker.centerX.equalToSuperview()
            maker.centerY.equalToSuperview()}
        
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
        
    }
    

}
