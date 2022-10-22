import 'package:agenda/factories/view/registration_abstract.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CategoryField extends RegistrationAbstract{
  CategoryField({required String? nameField}) : super(nameField: nameField);

  @override
  Widget build() {
    return CarouselSlider(
      options: CarouselOptions(height: 100),
      items: ['Estudar', 'Meditar', 'Exercicio', 'Ler', 'Outros'].map((e) {
        return Builder(
          builder: (context) {
            return Column(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.amber,
                ),
                Text(e)
              ],
            );
          },
        );
      }).toList(),
    );
  }

}