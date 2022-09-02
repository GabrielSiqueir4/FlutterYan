class Calculo {
  double input;
  String nomeFrom;
  String nomeTo;
  double resultado;

  get getInput => this.input;

  set setInput(input) => this.input = input;

  get getNomeFrom => this.nomeFrom;

  set setNomeFrom(nomeFrom) => this.nomeFrom = nomeFrom;

  get getNomeTo => this.nomeTo;

  set setNomeTo(nomeTo) => this.nomeTo = nomeTo;

  get getResultado => this.resultado;

  set setResultado(resultado) => this.resultado = resultado;

  Calculo(this.input, this.nomeFrom, this.nomeTo, this.resultado);
}
