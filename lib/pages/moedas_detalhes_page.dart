import 'package:flutter/material.dart';
import 'package:flutter_aula_1/models/moeda.dart';

class MoedasDetalhesPage extends StatefulWidget {
  Moeda moeda;
  
  MoedasDetalhesPage({Key? key, required this.moeda}) : super(key: key);

  @override
  State<MoedasDetalhesPage> createState() => _MoedasDetalhesPegaState();
}

class _MoedasDetalhesPegaState extends State<MoedasDetalhesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.moeda.nome),
      ),
      body: Column(
        children: [
          Divider(),
          Row(
            children: [
              SizedBox(
                child: Image.asset(widget.moeda.icone), 
                width: 50,
              ),
            ],
          ),
        ],
      ),
    );
  }
}