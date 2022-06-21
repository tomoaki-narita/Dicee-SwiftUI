//
//  ContentView.swift
//  Dicee-SwiftUI
//
//  Created by output. on 2022/06/20.
//

import SwiftUI

struct ContentView: View {
    @State var leftDiceNumber = 1 //構造体の変数は更新できないので@Stateをつける
    @State var rightDiceNumber = 1
    var body: some View {
        ZStack {
            //backgroundの画像
            Image("background")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            //Diceロゴ
            VStack {
                Image("diceeLogo")
                
                Spacer()//スペースを開ける
                
                //サイコロimage
                HStack {
                    //ランダムに1~6が入ってきた変数をDiceView構造体の引数に代入して実行
                    DiceView(n: leftDiceNumber)
                    DiceView(n: rightDiceNumber)
                }
                .padding(.horizontal)//サイコロ2つに余白をつける
                
                Spacer()//スペースを開ける
                
                //ボタンが押されたときの処理
                Button(action: {
                    leftDiceNumber = Int.random(in: 1...6)//leftDiceNumberにランダムで1~6を代入
                    rightDiceNumber = Int.random(in: 1...6)
                    
                    
                }) {
                    Text("Roll")//ボタンのtextとサイズ、色、位置調整
                        .font(.system(size: 50))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.horizontal)
                }
                .background(Color.red)//ボタンの背景色
                
                Spacer()//スペースを開ける
            }
        }
    }
}

//引数nを取ってサイコロのimageを変える構造体
struct DiceView: View {
    let n: Int//引数
    var body: some View {
        Image("dice\(n)")//サイコロのimageの名前
            .resizable()//サイコロのimageのリサイズ
            .aspectRatio(1, contentMode: .fit)//1は縦横1:1を意味する
            .padding()//サイコロのimageに余白をつける
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 13 Pro")
    }
}


