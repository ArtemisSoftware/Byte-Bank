

import 'package:bytebank/components/Editor.dart';
import 'package:bytebank/models/Transferencia.dart';
import 'package:flutter/material.dart';


const _tituloAppBar = "Criando Transferência";
const _rotuloNumeroConta = "Número da conta";
const _dicaNumeroConta = "0000";
const _rotuloValor = "Valor";
const _dicaCampoValor = "0.00";
const _textoBotaoConfirmar = "Confirmar";

class FormularioTransferencia extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }

}



class FormularioTransferenciaState extends State<FormularioTransferencia> {


  final TextEditingController _controladorCampoNumeroConta = TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
          title: Text(_tituloAppBar)
      ),


      body: SingleChildScrollView(
        child: Column(
          children: [

            Editor(controlador: _controladorCampoNumeroConta, rotulo: _rotuloNumeroConta, dica: _dicaNumeroConta),

            Editor(controlador: _controladorCampoValor, rotulo: _rotuloValor, dica: _dicaCampoValor, icon: Icons.monetization_on),

            RaisedButton(
              child: Text(_textoBotaoConfirmar),
              onPressed: (){
                _criaTransferencia(context);
              },
            )

          ],
        ),
      ),
    );
  }


  void _criaTransferencia(BuildContext context) {
    debugPrint("NumeroConta:" + _controladorCampoNumeroConta.text);

    final int numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
    final double valor = double.tryParse(_controladorCampoValor.text);

    if(numeroConta != null && valor != null) {

      final transferenciaCriada = Transferencia(valor, numeroConta);
      debugPrint('$transferenciaCriada');
      Navigator.pop(context, transferenciaCriada);
    }
  }
}
