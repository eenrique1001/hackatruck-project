//
//  Model.swift
//  Doubloons
//
//  Created by Turma01-11 on 28/02/25.
//

import Foundation

struct Financeiro: Codable {
    var nome: String
    var saldoEmConta: Double
    var rendaBrutaMensal: Double
    var saldoRestanteMensal: Double
    var gastosFixos: GastosFixos
    var metasFinanceiras: MetasFinanceiras
    var reservaEmergencial: ReservaEmergencial
    var tarefas: [Tarefa]
}

struct GastosFixos: Codable {
    var totalGastos: Double
    var gastos: [Gasto]
}

struct Gasto: Codable {
    var titulo: String
    var valor: Double
}

struct MetasFinanceiras: Codable {
    var totalMetas: Double
    var metas: [Meta]
}

struct Meta: Codable {
    var titulo: String
    var valor: Double
    var mensalmente: Double
    var totalAcumulado: Double
    var dataCriacao: Int64
}

struct ReservaEmergencial: Codable {
    var totalReserva: Double
    var mensalmente: Double
    var guardadoEsteMes: Double
    var quantidadeDeMesesAcumulados: Int
    var dataCriacao: Int64
}

struct Tarefa: Codable {
    var titulo: String
    var descricao: String
    var prioridade: String
    var status: String
}

