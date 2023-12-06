

import 'package:flutter/material.dart';
import 'package:thecatapi/src/models/cat_image.dart';

class Cat{
  
  String name = '';
  int affectionLevel = 0;
  int energyLevel = 0;
  int intelligenceLevel = 0;
  int dogFriendlyLevel = 0;
  CatImage fotinho = CatImage('', '', 0, 0);

  Cat(this.name, this.affectionLevel, this.energyLevel, this.intelligenceLevel, this.dogFriendlyLevel, this.fotinho);

  Cat.fromJson(List<dynamic> json){
    fotinho = CatImage.fromJson(json);
    
    json = json[0]['breeds'];
    print(json[0]['name']);
    this.name = json[0]['name'] ?? '';
    affectionLevel = json[0]['affection_level'] ?? 0;
    energyLevel = json[0]['energy_level'] ?? 0;
    intelligenceLevel = json[0]['intelligence'] ?? 0;
    dogFriendlyLevel = json[0]['dog_friendly'] ?? 0;
  }

  




}