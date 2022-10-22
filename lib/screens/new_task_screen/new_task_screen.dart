import 'package:agenda/comum/consts.dart';
import 'package:agenda/factories/view/category_field.dart';
import 'package:agenda/factories/view/registration_field.dart';
import 'package:flutter/material.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({ Key? key }) : super(key: key);

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nova tarefa'),
        elevation: 0,
        centerTitle: true,
        backgroundColor: colorAppBar,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
          child: Column(
            children: [
              RegistrationField(
                nameField: 'Nome da tarefa',
              ).create(),
              RegistrationField(
                nameField: 'Data',
              ).create(),
              Row(
                children: [
                  Expanded(
                    child: RegistrationField(
                      nameField: 'Horário de início',
                    ).create(),
                  ),
                  Expanded(
                    child: RegistrationField(
                      nameField: 'Horário de início',
                    ).create(),
                  ),
                ],
              ),
              CategoryField(nameField: 'Categoria').create(),
            ],
          ),
        ),
      ),
    );
  }
}