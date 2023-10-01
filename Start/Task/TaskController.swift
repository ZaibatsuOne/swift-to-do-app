import UIKit
import SnapKit
import RealmSwift

class TaskController: UIViewController, UITextFieldDelegate {

    //MARK: - UI components
    private let taskName = CustomTextField(fieldType: .fullName)
    private let addTaskButton = UIButton()
    private let cancelButton = UIButton()
    
    //MARK: - Database
    private let realm = try! Realm()
    public var completitionHandler: (() -> Void)?
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cancelButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        addTaskButton.addTarget(self, action: #selector(handleSaveTask), for: .touchUpInside)
        taskName.becomeFirstResponder()
        taskName.delegate = self
        UISetup()
    }
    
    //MARK: - UI Setup
    private func UISetup(){
        view.backgroundColor = UIColor(red: 239/255, green: 239/255, blue: 239/255, alpha: 1)
        
        
        view.addSubview(taskName)
        view.addSubview(addTaskButton)
        view.addSubview(cancelButton)
        
        taskName.snp.makeConstraints{maker in
            maker.centerX.equalToSuperview()
            maker.centerY.equalToSuperview().inset(40)}
        
        addTaskButton.setTitle("Add Task", for: .normal)
        addTaskButton.setTitleColor(.link, for: .normal)
        
        addTaskButton.snp.makeConstraints{maker in
            maker.top.equalTo(taskName).inset(100)
            maker.right.equalToSuperview().inset(20)}
        
        cancelButton.setTitle("Cancel/Back", for: .normal)
        cancelButton.setTitleColor(.systemRed, for: .normal)
        
        cancelButton.snp.makeConstraints{maker in
            maker.top.equalTo(taskName).inset(100)
            maker.left.equalToSuperview().inset(20)}
    }
    
    //MARK: - Selectors
    @objc func goBack(){
        _ = navigationController?.popViewController(animated: true)
    }
    
    @objc func handleSaveTask(){
        if let text = taskName.text, !text.isEmpty  {
            realm.beginWrite()
            
            let newItem = TaskItem()
            newItem.name = text
            
            realm.add(newItem)
            
            try! realm.commitWrite()
            completitionHandler?()
            
            taskName.text = ""
        }
        else{
            let alertModal = UIAlertController(title: "Внимание", message: "Поле для добавления задачи не может быть пустым", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default)
            alertModal.addAction(okAction)
            self.present(alertModal, animated: true, completion: nil)

        }
    }
}
