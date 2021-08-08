//
//  ViewController.swift
//  gueseEnglish
//
//  Created by water on 2021/8/8.
//
import UIKit

class ViewController: UIViewController {

    var qna0 = [
        Qna(question: "老虎", answer: "tiger"),
/*        Qna(question: "小貓", answer: "cat"),
        Qna(question: "小狗", answer: "dog"),
        Qna(question: "老鼠", answer: "mouse"),
        Qna(question: "裙子", answer: "skirt"),
        Qna(question: "鞋子", answer: "shoes"),
        Qna(question: "看", answer: "look"),
        Qna(question: "重的", answer: "heavy"),
        Qna(question: "滿的", answer: "full"),
        Qna(question: "空的", answer: "empty"),
        Qna(question: "輕的", answer: "light"),
        Qna(question: "畫畫", answer: "draw"),
        Qna(question: "名字", answer: "name"),
 */       Qna(question: "兔子", answer: "rabbit"),
        Qna(question: "猴子", answer: "monkey")
    ]
    
    var qna1 = [
        Qna(question: "00", answer: "00"),
        Qna(question: "11", answer: "11"),
        Qna(question: "22", answer: "22"),
        ]
    
    var qna2 = [
        Qna(question: "aa", answer: "aa"),
        Qna(question: "bb", answer: "bb"),
        Qna(question: "bb", answer: "bb"),
        ]
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var answerTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel! //顯示輸入是否正確
    @IBOutlet weak var correctLabel: UILabel! //顯示答對次數
    @IBOutlet weak var watchAnswerButton: UIButton! //看解答按鈕
    @IBOutlet weak var sendAnswerButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var replayButton: UIButton!
    @IBOutlet weak var flowerLabel: UILabel!
    @IBOutlet weak var backview: UIView!
    
    

    var index = 0 //陣列索引
    var guess = 0 //紀錄猜錯次數
    var correct = 0 //紀錄猜對次數
    var flower:String = "" //列印小花次數
    
    //畫面重整function
    func updateQuestion(){
        questionLabel.text = qna0[index].question
    }
    
    func updateAnswer(){
        answerLabel.text = qna0[index].answer
    }
    
    func updateShuffle(){
        qna0.shuffle()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateShuffle()
        updateQuestion()
        watchAnswerButton.isEnabled = false
        replayButton.isEnabled = false
        nextButton.isEnabled = false
        backview.layer.cornerRadius = 15
        // Do any additional setup after loading the view.
    }
//程式開始
    
    //送出答案按鈕
    @IBAction func answer(_ sender: Any) {
        
        if answerTextField.text == qna0[index].answer{
            resultLabel.text = "答對了"
            correct = correct + 1
            updateAnswer()
            nextButton.isEnabled = true
            sendAnswerButton.isEnabled = false
            flower = flower + "🌼"
            flowerLabel.text = flower

        } else {
            guess = guess + 1
            switch guess {
            case 2 :
                resultLabel.text = "答錯第二次囉"
            case 3 :
                resultLabel.text = "答錯第三次囉"
            case 4 :
                resultLabel.text = "猜不到的話，可以看解答"
                watchAnswerButton.isEnabled = true
                sendAnswerButton.isEnabled = false
            default :
                resultLabel.text = "答錯囉"
            }
        }
    }
    
    
    //下一題按鈕
    @IBAction func next(_ sender: Any) {
        if index == qna0.count - 1  {
            resultLabel.text = "恭喜把全部題目猜完了"
            correctLabel.text = "總共 \(qna0.count) 題，你答對 \(correct) 題"
            nextButton.isEnabled = false
            sendAnswerButton.isEnabled = false
            replayButton.isEnabled = true
            watchAnswerButton.isEnabled = false
        } else {
        index = index + 1 //下一題
        guess = 0 //猜錯次數歸零
        updateQuestion()
        answerTextField.text = ""
        answerLabel.text = ""
        resultLabel.text = ""
        watchAnswerButton.isEnabled = false
        sendAnswerButton.isEnabled = true
        nextButton.isEnabled = false
    }
    }
    
    //看解答按鈕
    @IBAction func watchAnswer(_ sender: Any) {
        updateAnswer()
        nextButton.isEnabled = true
        sendAnswerButton.isEnabled = false
    }
    
    //重玩一次按鈕
    @IBAction func replay(_ sender: Any) {
        updateShuffle()
        index = 0
        updateQuestion()
        correct = 0
        guess = 0
        flower = ""
        answerTextField.text = ""
        answerLabel.text = ""
        resultLabel.text = ""
        resultLabel.text = ""
        correctLabel.text = ""
        sendAnswerButton.isEnabled = true
        replayButton.isEnabled = false
        nextButton.isEnabled = false
        flowerLabel.text = ""
        
    }
    
   
//程式結束
}

