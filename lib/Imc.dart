import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter/widgets.dart';

class Imc extends StatefulWidget {
  const Imc({super.key});

  @override
  State<Imc> createState() => _ImcState();
}

class _ImcState extends State<Imc> {
  // controller
  // controller altura
  TextEditingController _alturaController   = TextEditingController();
  // controller peso
  TextEditingController _pesoController     = TextEditingController();

  // atributo
  String _resultado = "      ";
  var _imc;
  var _corMagreza = Colors.pink.withOpacity(0);
  var _corNormal = Colors.pink.withOpacity(0);
  var _corSobrepeso = Colors.pink.withOpacity(0);
  var _corObesidade = Colors.pink.withOpacity(0);
  var _corObesidadeGrave = Colors.pink.withOpacity(0);

  // metodo
  // metodo que calcula o imc a partir do calculo peso / altura^2
  void _calcularIMC(){
    // variavel altura criada a partir do controller/objeto alturaController
    var altura    = double.tryParse(_alturaController.text)!;
    // variavel peso criada a partir do controller/objeto pesoController
    var peso      = double.tryParse(_pesoController.text)!;

    // variavel imc que calcula o imc
    _imc = peso / (altura * altura);

    setState(() {
      _resultado = _imc.toStringAsFixed(2);
    });
  }

  // metodo que, a partir do calculo imc, exibe na tabela qual a classificação e nivel de obesidade do usuario
  void _classificacao(){
    if(_imc < 18.5){
      setState(() {
        _corMagreza = Colors.pink.withOpacity(0.1);
        _corNormal = Colors.pink.withOpacity(0);
        _corSobrepeso = Colors.pink.withOpacity(0);
        _corObesidade = Colors.pink.withOpacity(0);
        _corObesidadeGrave = Colors.pink.withOpacity(0);
      });
    } else if (_imc >= 18.5 && _imc <= 24.9){
      setState(() {
        _corMagreza = Colors.pink.withOpacity(0);
        _corNormal = Colors.pink.withOpacity(0.1);
        _corSobrepeso = Colors.pink.withOpacity(0);
        _corObesidade = Colors.pink.withOpacity(0);
        _corObesidadeGrave = Colors.pink.withOpacity(0);
      });
    } else if (_imc >= 25 && _imc <= 29.9){
      setState(() {
        _corMagreza = Colors.pink.withOpacity(0);
        _corNormal = Colors.pink.withOpacity(0);
        _corSobrepeso = Colors.pink.withOpacity(0.1);
        _corObesidade = Colors.pink.withOpacity(0);
        _corObesidadeGrave = Colors.pink.withOpacity(0);
      });
    } else if (_imc >= 30 && _imc <= 39.9){
      setState(() {
        _corMagreza = Colors.pink.withOpacity(0);
        _corNormal = Colors.pink.withOpacity(0);
        _corSobrepeso = Colors.pink.withOpacity(0);
        _corObesidade = Colors.pink.withOpacity(0.1);
        _corObesidadeGrave = Colors.pink.withOpacity(0);
      });
    } else if (_imc >= 40){
      setState(() {
        _corMagreza = Colors.pink.withOpacity(0);
        _corNormal = Colors.pink.withOpacity(0);
        _corSobrepeso = Colors.pink.withOpacity(0);
        _corObesidade = Colors.pink.withOpacity(0);
        _corObesidadeGrave = Colors.pink.withOpacity(0.1);
      });
    }
  }

  void _limpar(){
    _alturaController.text = "";
    _pesoController.text   = "";

    setState(() {
      _resultado = "      ";
      _corMagreza = Colors.pink.withOpacity(0);
      _corNormal = Colors.pink.withOpacity(0);
      _corSobrepeso = Colors.pink.withOpacity(0);
      _corObesidade = Colors.pink.withOpacity(0);
      _corObesidadeGrave = Colors.pink.withOpacity(0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        // start
        leading:  Icon(
          Icons.balance_outlined,
          color: Colors.white,
          size: 28,
        ),
        // center
        title: Text(
          "Calculadora de IMC",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 20
          ),
        ),
        // end
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.menu_rounded,
              color: Colors.white,
              size: 28,
            ),
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "images/fitaMetrica.png",
                fit: BoxFit.scaleDown,
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 30),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                      ),
                      Row(
                        children: [
                          Text(
                            "IMC ―――――――――――",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                          padding: EdgeInsets.only(top: 15)
                      ),
                      Row(
                        children: [
                          Text(
                            "Cálculo IMC",
                            style: TextStyle(
                              color: Colors.teal,
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Padding(
                              padding: EdgeInsets.only(top: 10)
                          ),
                          Text(
                            "IMC é a sigla para Índice de Massa Corpórea, parâmetro adotado pela Organização Mundial de Saúde para calcular o peso ideal de cada pessoa.",
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 12,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.only(top: 5)
                          ),
                          Text(
                            "O índice é calculado da seguinte maneira: divide-se o peso do paciente pela sua altura elevada ao quadrado. Diz-se que o indivíduo tem peso normal quando o resultado do IMC está entre 18,5 e 24,9.",
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 12,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.only(top: 5)
                          ),
                          Text(
                            "Quer descobrir seu IMC? Insira seu peso e sua altura nos campos abaixo e compare com os índices da tabela. Importante: siga os exemplos e use pontos como separadores.",
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 12,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                      TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelStyle: TextStyle(
                              color: Colors.teal,
                            ),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.teal
                                )),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.teal
                                )),
                            labelText: "Altura (ex.: 1.70)",
                          ),
                          controller: _alturaController
                      ),
                      Padding(
                          padding: EdgeInsets.only(top: 10)
                      ),
                      TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelStyle: TextStyle(
                              color: Colors.teal,
                            ),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.teal
                                )),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.teal
                                )),
                            labelText: "Peso (ex.: 69.2)",
                          ),
                          controller: _pesoController
                      ),
                      Padding(
                          padding: EdgeInsets.only(top: 30)
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>(Colors.teal)
                              ),
                              onPressed: (){
                                _calcularIMC();
                                _classificacao();
                                FocusScope.of(context).requestFocus(new FocusNode());
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Calcular",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 17
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ],
                              )
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all<Color>(Colors.pinkAccent)
                                ),
                                onPressed: (){
                                  _limpar();
                                  FocusScope.of(context).requestFocus(new FocusNode());
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Limpar",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 17
                                      ),
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ],
                                )
                            ),
                          ),
                        ],
                      ),
                      Padding(
                          padding: EdgeInsets.only(top: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  decoration: new BoxDecoration(
                                      color: Colors.teal,
                                      borderRadius: BorderRadius.all(Radius.circular(10))
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Row(
                                      children: [
                                        Center(
                                          child: Text(
                                            "     Veja a interpretação do IMC     ",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  )
                              ),
                            ],
                          )
                      ),
                      DataTable(
                        columns: <DataColumn>[
                          DataColumn(
                            label: Text(
                                "IMC",
                                style: TextStyle(
                                    color: Colors.teal
                                ),
                              ),
                          ),
                          DataColumn(
                            label: Text(
                                "Classificação",
                                style: TextStyle(
                                    color: Colors.teal
                                ),
                              ),
                          ),
                          DataColumn(
                            label: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Obesidade",
                                    style: TextStyle(
                                        color: Colors.teal
                                    ),
                                  ),
                                  Text(
                                    "(Grau)",
                                    style: TextStyle(
                                        color: Colors.teal
                                    ),
                                  ),
                                ],
                              )
                          ),
                        ],
                        rows: <DataRow>[
                          DataRow(
                            color: MaterialStateProperty.all<Color>(_corMagreza),
                            cells: <DataCell>[
                              DataCell(Text("<18.5")),
                              DataCell(Center(
                                child: Text("Magreza"),
                              )),
                              DataCell(Center(
                                child: Text("0"),
                              )),
                            ],
                          ),
                          DataRow(
                            color: MaterialStateProperty.all<Color>(_corNormal),
                            cells: <DataCell>[
                              DataCell(Text("18.5-24.9")),
                              DataCell(Center(
                                child: Text("Normal"),
                              )),
                              DataCell(Center(
                                child: Text("0"),
                              )),
                            ],
                          ),
                          DataRow(
                            color: MaterialStateProperty.all<Color>(_corSobrepeso),
                            cells: <DataCell>[
                              DataCell(Text("25.0-29.9")),
                              DataCell(Center(
                                child: Text("Sobrepeso"),
                              )),
                              DataCell(Center(
                                child: Text("I"),
                              )),
                            ],
                          ),
                          DataRow(
                            color: MaterialStateProperty.all<Color>(_corObesidade),
                            cells: <DataCell>[
                              DataCell(Text("30.0-39.9")),
                              DataCell(Center(
                                child: Text("Obesidade"),
                              )),
                              DataCell(Center(
                                child: Text("II"),
                              )),
                            ],
                          ),
                          DataRow(
                            color: MaterialStateProperty.all<Color>(_corObesidadeGrave),
                            cells: <DataCell>[
                              DataCell(Text(">40.0")),
                              DataCell(Center(
                                child: Text("Obesidade \n Grave"),
                              )),
                              DataCell(Center(
                                child: Text("III"),
                              )),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                          padding: EdgeInsets.only(top: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  decoration: new BoxDecoration(
                                      color: Colors.pinkAccent,
                                      borderRadius: BorderRadius.all(Radius.circular(20))
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Text(
                                      "Seu IMC: $_resultado",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  )
                              ),
                            ],
                          )
                      )
                    ],
                  )
              ),
            ],
          )
        ),
      ),
    );
  }
}
