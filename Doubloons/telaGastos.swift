//
//  telaGastos.swift
//  telaGastos
//
//  Created by Turma01-11 on 27/02/25.
//

import SwiftUI

struct telaGastos: View {
    
    @ObservedObject var financeiroView = FinanceiroViewModel()
    
    @State var gasto = Gasto(titulo: "", valor: nil)
    
    @State var bool = false
    
    @State var text = ""
    
    var body: some View {
        VStack{
            VStack{
                HStack{
                    Text("Gastos Fixos")
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
                        Text("R$ 522,04")
                            .font(.title3)
                            .bold()
                            .padding(.leading, 20)
                    }
                    .padding(.bottom, 10)
                    Spacer()
                }
                .padding(.bottom, 10)
            }
            .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.black]), startPoint: .topTrailing, endPoint: .bottomLeading))
            .foregroundColor(.white)
            .clipShape(UnevenRoundedRectangle(cornerRadii: .init(topLeading: 20, bottomLeading: 20)))
            .shadow(radius: 10)
            .padding(.leading, 15).offset()
            
            Spacer().frame(height: 50)
            
            ScrollView{
                VStack{
                    HStack{
                        Spacer()
                        Text("Aluguel")
                            .fontWeight(.medium)
                        Spacer().frame(width: 120)
                        Text("$5000,00")
                            .fontWeight(.medium)
                        Image(systemName: "trash.fill")
                        Spacer()
                    }
                    .frame(width: 340, height: 60)
                    .background(.white)
                    .cornerRadius(20.0)
                    .shadow(radius: 8)
                    Spacer().frame(height: 35)
                    HStack{
                        Spacer()
                        Text("Comida")
                            .fontWeight(.medium)
                        Spacer().frame(width: 129)
                        
                        Text("$850,00")
                            .fontWeight(.medium)
                        Image(systemName: "trash.fill")
                        Spacer()
                    }.frame(width: 340, height: 60)
                        .background(.white)
                        .cornerRadius(20.0)
                        .shadow(radius: 8)
                    Spacer().frame(height: 35)
                    
                    HStack{
                        Spacer()
                        Text("Transporte")
                            .fontWeight(.medium)
                        Spacer().frame(width: 110)
                        
                        Text("$126,40")
                            .fontWeight(.medium)
                        Image(systemName: "trash.fill")
                        Spacer()
                    }.frame(width: 340, height: 60)
                        .background(.white)
                        .cornerRadius(20.0)
                        .shadow(radius: 8)
                }.padding()
                
            }
            
            Spacer().frame(height: 60)
            
            
            Button(action: {bool.toggle()}, label: {
                HStack{
                    Text("Adicionar")
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                }.frame(width: 349, height: 60)
                    .background(LinearGradient(gradient: Gradient(colors:[.black, .red]),startPoint: .leading, endPoint: .trailing))
                    .clipShape(UnevenRoundedRectangle(cornerRadii: .init(bottomLeading: 10, topTrailing: 10)))
                    .shadow(radius: 8)
            })
            
            
            Spacer().frame(height: 40)
            
            HStack{
                Spacer().frame(width: 50)
                Text("Saldo Restante Mensal")
                    .foregroundStyle(.white)
                    .fontWeight(.semibold)
                
                Spacer().frame(width: 45)
                
                Text("$522,04")
                    .foregroundStyle(.white)
                    .fontWeight(.semibold)
                
            }.frame(width: 370, height: 60)
                .background(.cinzaescuro)
                .clipShape(UnevenRoundedRectangle(cornerRadii: .init(bottomTrailing: 10, topTrailing: 10)))
                .shadow(radius: 8)
                .offset(x: -65)
        }.sheet(isPresented: $bool, content: {
            VStack{
            Text("Adicionar Gasto")
                    .fontWeight(.semibold).padding(.leading, -173)
                HStack{
                    TextField("Insira um titulo", text: $gasto.titulo)
                        .overlay(VStack{Divider().offset(x: 0, y: 15)})
                }.padding()
                HStack{
                    TextField("Valor gasto", value: $gasto.valor, format: .number)
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
                .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.black]), startPoint: .topTrailing, endPoint: .bottomLeading))
                .clipShape(UnevenRoundedRectangle(cornerRadii: .init(topLeading: 20, bottomLeading: 20, bottomTrailing: 20)))
                .shadow(radius: 5)
                .padding(.leading, -170)

                Spacer().frame(height: 70)
                
                
                
                
            }.padding(.leading, 20)
        })
    }
}
#Preview {
    telaGastos()
}
