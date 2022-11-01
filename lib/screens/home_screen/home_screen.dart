import 'package:agenda/comum/consts.dart';
import 'package:agenda/screens/new_task_screen/new_task_screen.dart';
import 'package:agenda/stores/registration_store.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _registrationStore = RegistrationStore();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: const [
            Text(
              'Olá, seja bem-vindo',
              style: TextStyle(
                fontSize: 17.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Hoje é um novo dia',
              style: TextStyle(
                fontSize: 13.0,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: (){},
            tooltip: 'Visualizar calendário', 
            icon: const Icon(Icons.calendar_month),
          ),
        ],
        elevation: 0,
        backgroundColor: colorAppBar,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
        child: Column(
          children: [
            Text(
              'Tarefas do dia'
            ),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const NewTaskScreen()),
          );
        },
        backgroundColor: colorAppBar,
        child: const Icon(Icons.add),
      ),
    );
  }
}