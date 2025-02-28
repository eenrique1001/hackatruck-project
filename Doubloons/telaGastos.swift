//
//  telaGastos.swift
//  telaGastos
//
//  Created by Turma01-11 on 27/02/25.
//

import SwiftUI

struct telaGastos: View {
    
    var body: some View {
        VStack{
            HStack{
                Image(systemName: "house")
                    .resizable()
                    .frame(width: 40, height: 30)
                    .imageScale(.large)
                    .foregroundStyle(.white)
                Text("")
                Text("Início")
                    .foregroundStyle(.white)
                    .font(.title2)
            }.frame(width: 150, height: 50).clipShape(Rectangle()).background(LinearGradient(gradient: Gradient(colors:[ .black, .red]),startPoint: .leading, endPoint: .trailing))
                .cornerRadius(20.0)
                .padding(.leading,-205)
                .shadow(radius: 5)
                .offset(x: -10, y: -2)
            
            Spacer().frame(height: 28)
            
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
            .padding(.leading, 15)
            
            Spacer().frame(height: 30)
            
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
            Spacer().frame(height: 60)
            
            HStack{
                Text("Adicionar")
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
            }.frame(width: 349, height: 60)
                .background(LinearGradient(gradient: Gradient(colors:[.black, .red]),startPoint: .leading, endPoint: .trailing))
                .clipShape(UnevenRoundedRectangle(cornerRadii: .init(bottomLeading: 10, topTrailing: 10)))
                .shadow(radius: 8)
            
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
        }
    }
}
#Preview {
    telaGastos()
}
