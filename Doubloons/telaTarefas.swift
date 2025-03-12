//
//  telaTarefas.swift
//  Doubloons
//
//  Created by Turma01-11 on 28/02/25.
//

import SwiftUI

struct telaTarefas: View {
    @State var text : String = ""
    
    @State var tarefa = Tarefa(titulo: "", descricao: "", prioridade: "", status: "")
    
    
    
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
                        .resizable()
                        .frame(width: 40, height: 20)
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
            .background(LinearGradient(gradient: Gradient(colors: [.ocreC, .ocreE]), startPoint: .topTrailing, endPoint: .bottomLeading))
            .foregroundColor(.white)
            .clipShape(UnevenRoundedRectangle(cornerRadii: .init(topLeading: 20, bottomLeading: 20)))
            .shadow(radius: 10)
            .padding(.leading, 15).offset()
            
            Spacer().frame(height: 50)
            
            HStack{
                VStack{
                Text("Criar tarefa")
                        .fontWeight(.semibold).padding(.leading, -173)
                    HStack{
                        TextField("Insira um titulo", text: $tarefa.titulo)
                            .overlay(VStack{Divider().offset(x: 0, y: 15)})
                    }.padding()
                    HStack{
                        TextField("Insira uma descrição", text: $tarefa.descricao)
                            .overlay(VStack{Divider().offset(x: 0, y: 15)})
                    }.padding()
                    HStack{
                        TextField("Insira a prioridade", text: $tarefa.prioridade)
                            .overlay(VStack{Divider().offset(x: 0, y: 15)})
                    }.padding()
                    HStack{
                        TextField("Insira o status da tarefa", text: $tarefa.status)
                            .overlay(VStack{Divider().offset(x: 0, y: 15)})
                    }.padding()

                    Spacer().frame(height: 35)
                    HStack{
                        Button( action: {
                            print("")
                        }, label: {
                            Text("Criar")
                                .font(.title3)
                                .fontWeight(.semibold)
                        })
                       
                    }
                    .foregroundColor(.white)
                    .frame(width: 130, height: 60)
                    .background(LinearGradient(gradient: Gradient(colors: [.ocreC, .ocreE]), startPoint: .topTrailing, endPoint: .bottomLeading))
                    .clipShape(UnevenRoundedRectangle(cornerRadii: .init(topLeading: 20, bottomLeading: 20, bottomTrailing: 20)))
                    .shadow(radius: 5)
                    .padding(.leading, -170)

                    Spacer().frame(height: 35)
                    
                    Text("Tarefas criadas:").padding(.leading, -165).bold()
                    
                    
                    
                }.padding(.leading, 20)
        }
        }
    }
}

#Preview {
    telaTarefas()
}
