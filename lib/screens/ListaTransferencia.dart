
import 'package:bytebank/models/Transferencia.dart';
import 'package:flutter/material.dart';

import 'FormularioTransferencia.dart';


const _tituloAppBar = "Transferências";

class ListaTransferencia extends StatefulWidget{

  final List<Transferencia> _transferencias = List();

  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciaState();
  }
}

class ListaTransferenciaState extends State<ListaTransferencia>{

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),


      body: ListView.builder(


        itemCount: widget._transferencias.length,
        itemBuilder: (context, indice){

          return ItemTransferencia(widget._transferencias[indice]);
        },

      ),

      floatingActionButton: FloatingActionButton(

        child: Icon(Icons.add),

        onPressed: (){

          Navigator.push(context, MaterialPageRoute(builder: (context){
            return FormularioTransferencia();
          }))
          .then((transferenciaRecebida) {

            _atualizarTransferencia(transferenciaRecebida);
          });
        },
      ),
    );
  }

  void _atualizarTransferencia(transferenciaRecebida) {

    debugPrint("transferenciaRecebida: "  + '$transferenciaRecebida');


    if(transferenciaRecebida != null) {

      setState(() {
        widget._transferencias.add(transferenciaRecebida);
      });
    }
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
