import 'package:flutter/material.dart';

class CatImage {
  String id = '';
  String url = '';
  int width = 0;
  int height = 0;
  Image imagem = Image.network('');

  CatImage(this.id, this.url, this.width, this.height);

  CatImage.fromJson(List<dynamic> json) {
    id = json[0]['breed'].toString();
    url = json[0]['url'];
    width = json[0]['width'];
    height = json[0]['height'];
    imagem = Image.network(
      url,
      loadingBuilder: (context, child, loadingProgress) {
        return loadingProgress == null
            ? child
            : SizedBox(
                height: 200,
                width: 200,
                child: Center(
                  child: Transform.scale(
                    scale: 1.75,
                    child: const CircularProgressIndicator(
                      backgroundColor: Colors.white,
                      color: Colors.greenAccent,
                      strokeWidth: 6.66,
                    ),
                  ),
                ),
              );
      },
    );
  }
}
