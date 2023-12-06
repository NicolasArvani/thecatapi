import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:thecatapi/src/models/cat.dart';
import 'dart:async';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:thecatapi/src/models/cat_image.dart';
import 'package:thecatapi/src/widgets/cat_info.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  Image fotoGatinho = Image.network(
    'https://i.gifer.com/origin/34/34338d26023e5515f6cc8969aa027bca.gif',
    height: 50,
    width: 50,
  );
  Cat gatinho = Cat('', 0, 0, 0, 0, CatImage('', '', 0, 0));
  Widget gatinhoInfo = const Text(
    'Clique no botão para ver um gatinho 😺\n',
    style: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
  );

  void fetchCat() async {
    fotoGatinho = Image.network(
        'https://i.gifer.com/origin/34/34338d26023e5515f6cc8969aa027bca.gif');
    var key = dotenv.env['API_KEY'];
    var url = Uri.parse(
        'https://api.thecatapi.com/v1/images/search?api_key=$key&has_breeds=true');
    var resposta = await get(url);
    // print(resposta.body);
    var gatinho = Cat.fromJson(jsonDecode(resposta.body));
    print("URL:  " + gatinho.fotinho.url);
    setState(() =>
        {fotoGatinho = gatinho.fotinho.imagem, gatinhoInfo = CatInfo(gatinho)});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 148, 11, 146),
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          title: const Row(
            children: [
              Image(
                image: NetworkImage(
                    'https://i.pinimg.com/originals/23/51/bc/2351bc65b2b5d75cef146b7edddf805b.gif'),
                height: 50,
                width: 50,
              ),
              Text('    PDM 2023 - The Cat API'),
            ],
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width - 50,
                  maxHeight: MediaQuery.of(context).size.height * 0.6,
                ),
                child: fotoGatinho,
              ),
              gatinhoInfo,
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.indigo,
                  ),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                  ),
                ),
                child: const Text('Novo Gato!!!', style: TextStyle(fontSize: 20)),
                onPressed: () {
                  fetchCat();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
