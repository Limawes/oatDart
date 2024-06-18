import 'dart:io';

void main() {
  while (true) {
    print('\nSelecione uma opção:');
    print('1 - Conversor de Temperatura');
    print('2 - Calculadora de Média de Notas');
    print('3 - Verificador de Números Primos');
    print('4 - Gerador de Fibonacci');
    print('5 - Cálculo de Desconto de Produto');
    print('0 - Sair');

    String? escolha = stdin.readLineSync();

    switch (escolha) {
      case '1':
        conversorDeTemperatura();
        break;
      case '2':
        calculadoraDeMedia();
        break;
      case '3':
        verificadorDePrimos();
        break;
      case '4':
        geradorDeFibonacci();
        break;
      case '5':
        calculoDeDesconto();
        break;
      case '0':
        print('Saindo...');
        return;
      default:
        print('Opção inválida. Tente novamente.');
    }
  }
}

void conversorDeTemperatura() {
  double fahrenheitTemp = 68.0;
  double celsiusTemp = 20.0;

  double fahrenheitParaCelsius(double fahrenheit) {
    return (fahrenheit - 32) * 5 / 9;
  }

  double celsiusParaFahrenheit(double celsius) {
    return (celsius * 9 / 5) + 32;
  }

  double celsiusConvertido = fahrenheitParaCelsius(fahrenheitTemp);
  double fahrenheitConvertido = celsiusParaFahrenheit(celsiusTemp);

  print(
      '$fahrenheitTemp°F é equivalente a ${celsiusConvertido.toStringAsFixed(2)}°C');
  print(
      '$celsiusTemp°C é equivalente a ${fahrenheitConvertido.toStringAsFixed(2)}°F');
}

void calculadoraDeMedia() {
  List<double> notas = [7.5, 9.0, 6.8, 8.2];

  double calcularMedia(List<double> notas) {
    double soma = 0.0;
    for (double nota in notas) {
      soma += nota;
    }
    return soma / notas.length;
  }

  double media = calcularMedia(notas);

  String status = media >= 6.0 ? 'Aprovado' : 'Reprovado';

  print('Média das notas: ${media.toStringAsFixed(2)}');
  print('Status do aluno: $status');
}

void verificadorDePrimos() {
  int numero = 29;

  bool ehPrimo(int n) {
    if (n <= 1) return false;
    for (int i = 2; i <= n ~/ 2; i++) {
      if (n % i == 0) return false;
    }
    return true;
  }

  List<int> listarDivisores(int n) {
    List<int> divisores = [];
    for (int i = 1; i <= n; i++) {
      if (n % i == 0) {
        divisores.add(i);
      }
    }
    return divisores;
  }

  if (ehPrimo(numero)) {
    print('$numero é um número primo');
  } else {
    print(
        '$numero não é um número primo. Divisores: ${listarDivisores(numero)}');
  }
}

void geradorDeFibonacci() {
  int n = 10;

  List<int> gerarFibonacci(int n) {
    List<int> sequencia = [0, 1];
    for (int i = 2; i < n; i++) {
      sequencia.add(sequencia[i - 1] + sequencia[i - 2]);
    }
    return sequencia;
  }

  List<int> fibonacciSeq = gerarFibonacci(n);

  print('Sequência de Fibonacci até o $n-ésimo termo: $fibonacciSeq');
}

void calculoDeDesconto() {
  double precoInicial = 120.0;

  double percentualDesconto = 15.0;

  double calcularPrecoComDesconto(double preco, double desconto) {
    return preco - (preco * (desconto / 100));
  }

  double precoFinal =
      calcularPrecoComDesconto(precoInicial, percentualDesconto);

  print('Preço inicial: R\$ $precoInicial');
  print('Percentual de desconto: $percentualDesconto%');
  print('Preço final após desconto: R\$ ${precoFinal.toStringAsFixed(2)}');
}
