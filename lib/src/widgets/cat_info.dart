import 'package:flutter/material.dart';
import 'package:thecatapi/src/models/cat.dart';

class CatInfo extends StatelessWidget {
  final Cat cat;

  CatInfo(this.cat);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: EdgeInsets.all(5),
      margin: const EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 2,
        ),
        // color: Colors.white30,
        borderRadius: BorderRadius.circular(10),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.white,
            Colors.white70,
          ],
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Raça: ", style: TextStyle(fontSize: 20),),
              Text(cat.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
              const Text("\n"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Nível de afeto: ', style: TextStyle(fontWeight: FontWeight.bold),),
              for (int i = 0; i < cat.affectionLevel; i++)
                const Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Nível de energia: ', style: TextStyle(fontWeight: FontWeight.bold),),
              for (int i = 0; i < cat.energyLevel; i++)
                const Icon(
                  Icons.bolt,
                  color: Colors.yellow,
                ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Nível de inteligência: ', style: TextStyle(fontWeight: FontWeight.bold),),
              for (int i = 0; i < cat.intelligenceLevel; i++)
                const Icon(
                  Icons.lightbulb,
                  color: Colors.blue,
                ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Amizade com cães: ', style: TextStyle(fontWeight: FontWeight.bold),),
              for (int i = 0; i < cat.dogFriendlyLevel; i++)
                const Icon(
                  Icons.pets,
                  color: Colors.green,
                ),
            ],
          ),
        ],
      ),
    );
  }
}
