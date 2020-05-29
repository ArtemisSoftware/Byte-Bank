import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(BytebankApp());
}






class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home:  Scaffold(


          body: FormularioTransferencia()
      ),


    );
  }
}






class FormularioTransferencia extends StatelessWidget {


  final TextEditingController _controladorCampoNumeroConta = TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
          title: Text("Criando Transferência")
      ),


      body: Column(
        children: [

          Editor(controlador: _controladorCampoNumeroConta, rotulo: "Número da conta",dica: "0000"),

          Editor(controlador: _controladorCampoValor, rotulo: "Valor",dica: "0.00", icon: Icons.monetization_on),



          RaisedButton(
            child: Text("Confirmar"),
            onPressed: (){

              _criaTransferencia();
            },
          )
        ],
      ),
    );
  }

  void _criaTransferencia() {
    debugPrint("NumeroConta:" + _controladorCampoNumeroConta.text);

    final int numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
    final double valor = double.tryParse(_controladorCampoValor.text);

    if(numeroConta != null && valor != null) {

      final transferenciaCriada = Transferencia(valor, numeroConta);
      debugPrint('$transferenciaCriada');
    }
  }
}

class Editor extends StatelessWidget {

  final TextEditingController controlador;
  final String rotulo;
  final String dica;
  final IconData icon;


  Editor({this.controlador, this.rotulo, this.dica, this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(

      padding: const EdgeInsets.all(16.0),

      child: TextField(
        controller: controlador,
        style: TextStyle(
            fontSize: 24.0
        ),
        decoration: InputDecoration(
            icon: icon != null ? Icon(icon) : null,
            labelText: rotulo,
            hintText: dica
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}




class ListaTransferencia extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Transferências"),
      ),


      body: Column(
        children: [

          ItemTransferencia(Transferencia(100, 1000)),

          ItemTransferencia(Transferencia(200, 2000)),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
      ),
    );
  }
}

class ItemTransferencia extends StatelessWidget{

  final Transferencia _transferencia;


  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(

      child: ListTile(

        leading: Icon(Icons.monetization_on),
        title: Text(_transferencia.valor.toString()),
        subtitle: Text(_transferencia.numeroConta.toString()),

      ),
    );
  }
  
}


class Transferencia{

  final double valor;
  final int numeroConta;

  Transferencia(this.valor, this.numeroConta);

  @override
  String toString() {
    return 'Transferencia{valor: $valor, numeroConta: $numeroConta}';
  }


}
