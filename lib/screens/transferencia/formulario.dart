import 'package:flutter/material.dart';

import '../../components/editor.dart';
import '../../models/transferencia.dart';

const _tituloAppBar = 'Criando Transferência';
const _rotuloCampoValor = 'Número da conta';
const _dicaCampoValor = '0.00';
const _rotuloCampoNumeroConta = 'Número da Conta';
const __dicaCampoNumeroConta = '0000';
const _textoBotaoConfirmar = 'Confirmar';

class FormularioTransferencia extends StatefulWidget {
  @override
  _FormularioTransferenciaState createState() =>
      _FormularioTransferenciaState();
}

class _FormularioTransferenciaState extends State<FormularioTransferencia> {
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();

  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Editor(
              controlador: _controladorCampoNumeroConta,
              rotulo: _rotuloCampoNumeroConta,
              dica: __dicaCampoNumeroConta,
            ),
            Editor(
              controlador: _controladorCampoValor,
              rotulo: _rotuloCampoValor,
              dica: _dicaCampoValor,
              icone: Icons.monetization_on,
            ),
            ElevatedButton(
              child: Text(_textoBotaoConfirmar),
              onPressed: () {
                _criaTransferencia(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _criaTransferencia(BuildContext context) {
    final int numeroConta = int.parse(_controladorCampoNumeroConta.text);
    final double valor = double.parse(_controladorCampoValor.text);
    final transferenciaCriada = Transferencia(valor, numeroConta);
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('$transferenciaCriada')));
    Navigator.pop(context, transferenciaCriada);
  }
}
