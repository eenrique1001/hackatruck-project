//
//  telaMetasFinanceiras.swift
//  Doubloons
//
//  Created by Turma01-11 on 28/02/25.
//

import SwiftUI

struct telaMetasFinanceiras: View {
    
    @State var titulo : String=""
    
    
    @State var meta = Meta(titulo: "", valor: nil, mensalmente: nil, total_acumulado: nil, data_criacao: 0)
    
    @ObservedObject var financeiroView = FinanceiroViewModel()
    
    @State var usuario : Financeiro = Financeiro(_id: "", _rev: "", nome: "", saldo_em_conta: 0, renda_bruta_mensal: 0, saldo_restante_mensal: 0, gastos_fixos: GastosFixos(total_gastos: 0, gastos: [Gasto(titulo: "", valor: 0)]), metas_financeiras: MetasFinanceiras(total_metas: 0, metas: [Meta(titulo: "teste", data_criacao: 1740405814346)]), reserva_emergencial: ReservaEmergencial(total_reserva: 0, mensalmente: 0, guardado_este_mes: 0, quantidade_de_meses_acumulados: 0, data_criacao: 0), tarefas: [Tarefa(titulo: "", descricao: "", prioridade: "", status: "")])
    
    @State var offsets = [CGSize](repeating: CGSize.zero, count: 6)

    private let swipeLeftLimit: CGFloat = -50
    private let swipeRightLimit: CGFloat = 50
    private let swipeLeftLimitToShow: CGFloat = -30
    private let swipeRightLimitToHide: CGFloat = 30
    
    var body: some View {
        VStack{
            VStack{
                HStack{
                    Text("Metas Financeiras")
                        .font(.title)
                        .fontWeight(.semibold)
                        .padding(.top, 20)
                        .padding(.leading, 20)
                        .padding(.bottom, 5)
                    Spacer()
                    HStack {
                        Image(systemName: "circle.fill")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundStyle(.cinzaclarin)
                            .padding()
                            .offset(x: 55)
                        Image(systemName: "circle.fill")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundStyle(.cinzasutil)
                            .padding()
                    }
                }
                HStack{
                    HStack{
                        Text("R$" + String(format: "%2.f", usuario.metas_financeiras.total_metas!))
                            .font(.title3)
                            .bold()
                            .padding(.leading, 20)
                    }
                    .padding(.bottom, 10)
                    Spacer()
                }
                .padding(.bottom, 10)
            }
            .background(LinearGradient(gradient: Gradient(colors: [.roxoC, .roxoE]), startPoint: .topTrailing, endPoint: .bottomLeading))
            .foregroundColor(.white)
            .clipShape(UnevenRoundedRectangle(cornerRadii: .init(topLeading: 20, bottomLeading: 20)))
            .shadow(radius: 10)
            .padding(.leading, 15)
        }
        Spacer().frame(height: 30)
        HStack{
            ScrollView{
            VStack{
                Text("Criar objetivo:")
                    .fontWeight(.semibold).padding(.leading, -173)
                HStack{
                    TextField("Insira um titulo", text: $meta.titulo)
                        .overlay(VStack{Divider().offset(x: 0, y: 15)})
                }.padding()
                HStack{
                    TextField("Valor do objetivo", value: $meta.valor, format: .number)
                        .overlay(VStack{Divider().offset(x: 0, y: 15)})
                }.padding()
                HStack{
                    TextField("Quantidade mensal pra guardar", value: $meta.mensalmente, format: .number)
                        .overlay(VStack{Divider().offset(x: 0, y: 15)})
                }.padding()
                
                HStack{
                    TextField("Total acumulado até o momento", value: $meta.total_acumulado, format: .number)
                        .overlay(VStack{Divider().offset(x: 0, y: 15)})
                }.padding()
                
                Spacer().frame(height: 15)
                HStack{
                    Button( action: {
                        meta.data_criacao = Int(Date().timeIntervalSince1970 * 1000)
                        
                        if(meta.valor != nil && meta.total_acumulado != nil && meta.mensalmente != nil) {
                            print(meta)
                            usuario.metas_financeiras.total_metas! += meta.valor!
                            usuario.metas_financeiras.metas.append(meta)
                            print(usuario)
                            financeiroView.post(usuario)
                            
                            meta.titulo = ""
                            meta.total_acumulado = nil
                            meta.mensalmente = nil
                            meta.valor = nil
                        }
                        
                        
                        
                    }, label: {
                        Text("Criar")
                            .font(.title3)
                            .fontWeight(.semibold)
                    })
                    
                }
                .foregroundColor(.white)
                .frame(width: 130, height: 60)
                .background(LinearGradient(gradient: Gradient(colors: [.roxoC, .roxoE]), startPoint: .topTrailing, endPoint: .bottomLeading))
                .clipShape(UnevenRoundedRectangle(cornerRadii: .init(topLeading: 20, bottomLeading: 20, bottomTrailing: 20)))
                .shadow(radius: 5)
                .padding(.leading, -170)
                
                Spacer().frame(height: 15)
                
                Text("Metas criadas:").padding(.leading, -165).bold()
                
                
                    VStack {
                        ForEach(Array(usuario.metas_financeiras.metas.enumerated()), id: \.offset) { index, m in
                            
                            HStack{
                                VStack(alignment: .leading){
                                    HStack{
                                        Spacer()
                                        
                                        Image(systemName: "trash.fill")
                                            .onTapGesture {
                                                usuario.metas_financeiras.total_metas! -= m.valor!
                                                usuario.metas_financeiras.metas.remove(at: index)
                                                financeiroView.post(usuario)
//                                                financeiroView.fetch()
                                            }
                                    }
                                    HStack{
                                        Text("Título:").fontWeight(.semibold)
                                        Spacer()
                                        Text(m.titulo)
                                    }.padding(5).background(.cinzaclaro).clipShape(Rectangle()).cornerRadius(10)
                                    
                                    HStack{
                                        Text("Valor: ").fontWeight(.semibold)
                                        Spacer()
                                        Text(String(format: "R$%.2f", m.valor ?? 0))
                                    }.padding(5).background(.cinzaclaro).clipShape(Rectangle()).cornerRadius(10)
                                    
                                    HStack{
                                        Text("Mensalmente: ").fontWeight(.semibold)
                                        Spacer()
                                        Text(String(format: "R$%.2f", m.mensalmente ?? 0))
                                    }.padding(5).background(.cinzaclaro).clipShape(Rectangle()).cornerRadius(10)
                                    
                                    HStack{
                                        Text("Total Acumulado: ").fontWeight(.semibold)
                                        Spacer()
                                        Text(String(format: "R$%.2f", m.total_acumulado ?? 0))
                                    }.padding(5).background(.cinzaclaro).clipShape(Rectangle()).cornerRadius(10)
                                    
                                    HStack{
                                        Text("Data Criação: ").fontWeight(.semibold)
                                        Spacer()
                                        Text(Date(timeIntervalSince1970: TimeInterval(m.data_criacao/1000)).formatted(date: .numeric, time: .omitted).description)
                                    }.padding(5).background(.cinzaclaro).clipShape(Rectangle()).cornerRadius(10)
                                    
                                }
                                
                            }
                            .padding()
                            .frame(width: 350)
                            .background(.white)
                            .clipShape(Rectangle()).cornerRadius(10)
                            .shadow(radius: 10)
                            
                            
//
                            
                        }.padding()
                    }
                    
                    
                }
                
            }
            .padding(.leading, 20)
        }
        Spacer()
    }
}



#Preview {
    telaMetasFinanceiras()
}
