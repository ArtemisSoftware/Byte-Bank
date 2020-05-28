import 'package:flutter/material.dart';

void main() {
  runApp(
      MaterialApp(

        home:  Scaffold(

          appBar: AppBar(
            title: Text("Transferências"),
          ),

          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
          ),

          body: ListaTransferencia()
        ),


      ),
  );
}


class ListaTransferencia extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        ItemTransferencia(Transferencia(100, 1000)),

        ItemTransferencia(Transferencia(200, 2000)),
      ],
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


}
