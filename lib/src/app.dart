import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:thecatapi/src/models/cat.dart';
import 'dart:async';
import 'package:flutter_dotenv/flutter_dotenv.dart';


import 'package:thecatapi/src/models/cat_image.dart';


class App extends StatefulWidget {
	@override
	State<StatefulWidget> createState() {
		return AppState();
	}
}

class AppState extends State<App> {

	Image fotoGatinho = Image.network('');
	Cat gatinho = Cat('', 0, 0, 0, 0, CatImage('', '', 0, 0));
  Column gatinhoInfo = Column(children: [],);

	void fetchCat() async{
		var key = dotenv.env['API_KEY'];
		var url = Uri.parse('https://api.thecatapi.com/v1/images/search?api_key=$key&has_breeds=true');
		var resposta = await get(url);
		// print(resposta.body);
		var gatinho = Cat.fromJson(jsonDecode(resposta.body));
		print("URL:  " + gatinho.fotinho.url);
		setState(() => {
        fotoGatinho = gatinho.fotinho.imagem,
        gatinhoInfo = gatinho.getInfo()
      }
		);
	}

	@override
	Widget build(BuildContext context) {
		return MaterialApp(
		home: Scaffold(
				appBar: AppBar(
					title: Text('Programação de Dispositivos Móveis 2023 - The Cat API'),
				),
				body: Center(
					child: Column(
						mainAxisAlignment: MainAxisAlignment.center,
						children: <Widget>[
              Image(image: fotoGatinho.image, height: 300, width: 300,),
							gatinhoInfo,
							ElevatedButton(
								child: Text('Novo Gato!!!'),
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