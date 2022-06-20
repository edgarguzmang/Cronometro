//
//  ContentView.swift
//  Temporizador
//
//  Created by Solidusystems on 20/06/22.
//

import SwiftUI

struct ContentView: View {
    @State var countdownTimer = 0
    @State var timerRunning = false
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    
    var body: some View {
        HStack(spacing:20){
            Image("logonav").resizable()
                .frame(width: 100, height: 100)
            Text("CRONOMETRO SOLIDUS")
                .foregroundColor(.white)
                .font(.system(size: 40, weight: .bold))
        }
        VStack(spacing:20){
            
            Button(action: {
                          print("Reloj funcionando")
                      }, label: {
                          Circle()
                              .fill(Color.blue)
                              .frame(width: 200, height: 200)
                              .shadow(radius: 10)
                              .overlay(
                               
                                Text("\(countdownTimer)")
                                    .padding()
                                    .onReceive(timer) { _ in
                                        if countdownTimer < 100 && timerRunning {
                                            countdownTimer += 1
                                        } else {
                                            timerRunning = false
                                        }
                                        
                                    }
                                      .foregroundColor(.white)
                                      .font(.system(size: 70, weight: .bold))
                              )
                      })
           
           
            HStack(spacing:30) {
               
          
                 Button(action: {
                     print("Inicio Correcto")
                     print("Iniciar")
                     timerRunning = true
                            }, label: {
                                
                                Text("Iniciar".uppercased())
                                 .font(.custom("Courier", size: 20))
                                 .fontWeight(.bold)
                                 .foregroundColor(.white)
                                 .padding()
                                 .background(Color.green)
                                 .cornerRadius(10)
                                 .shadow(radius: 10)
                                // .overlay(  )
                            })
                
               
                Button(action: {
                    print("Reinicio Correcto")
                    countdownTimer = 0
                           }, label: {
                               Text("Reiniciar".uppercased())
                                .font(.custom("Courier", size: 20))
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.red)
                                .cornerRadius(10)
                                .shadow(radius: 10)
                           })
                
                Button(action: {
                    print("STOP Correcto")
                    timerRunning = false
                           }, label: {
                               Text("Parar".uppercased())
                                //.font(.title)
                                .font(.custom("Courier", size: 20))
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.brown)
                                .cornerRadius(10)
                                .shadow(radius: 10)
                           })
               
            }
            //Spacer()
          HStack(alignment:.center,spacing:20){
                Button(action: {
                    print("Creador")
                    timerRunning = false
                           }, label: {
                               Text("Creador: Edgar Guzman".uppercased())
                                //.font(.title)
                                .font(.custom("Courier", size: 20))
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.blue)
                                .cornerRadius(10)
                                .shadow(radius: 10)
                           })
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}
