//
//  telaTarefas.swift
//  Doubloons
//
//  Created by Turma01-11 on 28/02/25.
//

import SwiftUI

struct telaTarefas: View {
    @State var text : String = ""
    var body: some View {
        VStack{
            VStack{
                HStack{
                    Text("Tarefas")
                        .font(.title)
                        .bold()
                        .padding(.top, 20)
                        .padding(.leading, 20)
                        .padding(.bottom, 5)
                    Spacer()
                    Image(systemName: "line.3.horizontal")
                        .imageScale(.large)
                        .foregroundStyle(.white)
                        .padding()
                }
                HStack{
                    HStack{
                        Text(" ")
                            .font(.title3)
                            .bold()
                            .padding(.leading, 20)
                    }
                    .padding(.bottom, 10)
                    Spacer()
                }
                .padding(.bottom, 10)
            }
            .background(LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.black]), startPoint: .topTrailing, endPoint: .bottomLeading))
            .foregroundColor(.white)
            .clipShape(UnevenRoundedRectangle(cornerRadii: .init(topLeading: 20, bottomLeading: 20)))
            .padding(.leading, 15)
            
            VStack{
                VStack {
                    HStack{
                        Text("Criar uma tarefa:")
                            .bold()
                        Spacer()
                    }.padding()
                    HStack{
                        TextField("Insira um titulo", text: $text)
                            .overlay(VStack{Divider().offset(x: 0, y: 15)})
                    }.padding()
                    HStack{
                        TextField("Insira um titulo", text: $text)
                            .overlay(VStack{Divider().offset(x: 0, y: 15)})
                    }.padding()
                    HStack{
                        TextField("Insira um titulo", text: $text)
                            .overlay(VStack{Divider().offset(x: 0, y: 15)})
                    }.padding()
                    
                }
                
                HStack{
                    HStack{
                        Text("Tarefas")
                            .font(.title3)
                            .bold()
                        //.padding(.leading, )
                        //.padding(.trailing, 125)
                    }
                    .foregroundColor(.white)
                    .padding(20)
                    .background(LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.black]), startPoint: .topTrailing, endPoint: .bottomLeading))
                    .clipShape(UnevenRoundedRectangle(cornerRadii: .init(topLeading: 20, bottomLeading: 20, bottomTrailing: 20)))
                    .padding()
                    
                    Spacer()
                }
                
                HStack {
                    Text("Tarefas criadas")
                        .bold()
                    Spacer()
                }.padding()
                
                ScrollView {
                    
                }.frame(maxHeight: 100)
            }
        }
    }
}

#Preview {
    telaTarefas()
}
