import 'dart:io';

class Pessoa {
  String nome;
  double peso;
  double altura;

  Pessoa(this.nome, this.peso, this.altura);
}

void main() {
  try {
    Pessoa pessoa = lerDadosDoTerminal();
    double imc = calcularIMC(pessoa);

    print("O IMC de ${pessoa.nome} é: $imc");
    
    classificarIMC(imc);
  } catch (e) {
    print("Erro: $e");
  }
}

Pessoa lerDadosDoTerminal() {
  print("Digite o nome da pessoa:");
  String? nome = stdin.readLineSync();

  if (nome == null || nome.isEmpty) {
    throw Exception("Nome inválido. Por favor, insira um nome.");
  }

  print("Digite o peso (em kg):");
  double peso = double.parse(stdin.readLineSync()!);

  print("Digite a altura (em metros):");
  double altura = double.parse(stdin.readLineSync()!);

  return Pessoa(nome, peso, altura);
}

double calcularIMC(Pessoa pessoa) {
  if (pessoa.altura <= 0) {
    throw Exception("Altura deve ser maior que zero.");
  }

  return pessoa.peso / (pessoa.altura * pessoa.altura);
}

void classificarIMC(double imc) {
  print("Classificação do IMC:");

  if (imc < 16) {
    print("Magreza grave");
  } else if (imc < 17) {
    print("Magreza moderada");
  } else if (imc < 18.5) {
    print("Magreza leve");
  } else if (imc < 25) {
    print("Saudável");
  } else if (imc < 30) {
    print("Sobrepeso");
  } else if (imc < 35) {
    print("Obesidade Grau I");
  } else if (imc < 40) {
    print("Obesidade Grau II (severa)");
  } else {
    print("Obesidade Grau III (mórbida)");
  }
}