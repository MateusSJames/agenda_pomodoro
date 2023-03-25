import 'package:agenda/comum/styles/consts.dart';
import 'package:agenda/factories/view/button_abstract.dart';
// import 'package:agenda/factories/view/category_field.dart';
import 'package:agenda/factories/view/registration_field.dart';
import 'package:agenda/factories/view/slider_field.dart';
import 'package:agenda/models/tasks.dart';
import 'package:agenda/screens/home_screen/home_screen.dart';
import 'package:agenda/stores/registration_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';

class NewTaskScreen extends StatefulWidget {
  final Tasks? task;
  const NewTaskScreen({
    Key? key,
    this.task,
  }) : super(key: key);

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

final _registrationStore = RegistrationStore();

class _NewTaskScreenState extends State<NewTaskScreen> {
  final _nameTaskController = TextEditingController();
  final _dateController = TextEditingController();
  final _initHourController = TextEditingController();
  final _endHourController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    _dateController.text = DateFormat('dd/MM/yyyy').format(DateTime.now());
    _registrationStore.setTaskDate(_dateController.text);
    if (widget.task != null) {
      _nameTaskController.text = widget.task!.nameTask!;
      _dateController.text = widget.task!.dateTask!;
      _initHourController.text = widget.task!.initHour!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nova tarefa'),
        elevation: 0,
        centerTitle: true,
        backgroundColor: colorAppBar,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ),
              (Route<dynamic> route) => false,
            );
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
            child: Column(
              children: [
                Observer(builder: (_) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Checkbox(
                          value: _registrationStore.isTask,
                          onChanged: (value) {
                            _registrationStore.setIsTask();
                          }),
                      const Text(
                        'Lembrete',
                        style: TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  );
                }),

                RegistrationField(
                    controller: _nameTaskController,
                    nameField: 'Nome da tarefa',
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Informe o nome da tarefa';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      _registrationStore.setTaskName(value);
                    }).create(),
                RegistrationField(
                  nameField: 'Data',
                  controller: _dateController,
                  onTap: () async {
                    await _selectDateTask(_dateController, context);
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Informe a data da tarefa';
                    }
                    return null;
                  },
                  enable: false,
                ).create(),
                Row(
                  children: [
                    Expanded(
                      child: RegistrationField(
                        nameField: 'Horário de início',
                        controller: _initHourController,
                        onTap: () async {
                          await _selectHourTask(_initHourController, context);
                          _registrationStore
                              .setTaskInitHour(_initHourController.text);
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Informe o horário de início';
                          }
                          return null;
                        },
                        enable: false,
                      ).create(),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Expanded(
                      child: RegistrationField(
                          nameField: 'Horário de término',
                          controller: _endHourController,
                          enable: false,
                          validator: (value) {
                            if (_registrationStore.isTask) {
                              return null;
                            } else {
                              if (value!.isEmpty) {
                                return 'Informe o horário de término';
                              }
                              return null;
                            }
                          },
                          onTap: () async {
                            await _selectHourTask(_endHourController, context);
                            _registrationStore
                                .setTaskEndHour(_endHourController.text);
                          }).create(),
                    ),
                  ],
                ),
                //CategoryField(nameField: 'Categoria').create(),
                Observer(builder: (_) {
                  return SliderField(
                      min: 1,
                      max: 10,
                      divisions: 3,
                      nameField: 'Sessões de trabalho',
                      valueStore: _registrationStore.session,
                      onChanged: (value) {
                        _registrationStore.setSessions(value);
                      }).create();
                }),
                Observer(builder: (_) {
                  return SliderField(
                      min: 1,
                      max: 120,
                      divisions: 5,
                      nameField: 'Duração de sessões',
                      valueStore: _registrationStore.duration,
                      onChanged: (value) {
                        _registrationStore.setDuration(value);
                      }).create();
                }),
                Observer(builder: (_) {
                  if (_registrationStore.loadingNewTask) {
                    return CircularProgressIndicator(
                      color: colorAppBar,
                    );
                  } else {
                    if (widget.task != null) {
                      return ButtonAbstract(
                        nameButton: 'Atualizar',
                        color: colorAppBar,
                        colorText: Colors.white,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            final task = Tasks(
                              id: widget.task!.id,
                              nameTask: _nameTaskController.text,
                              dateTask: _dateController.text,
                              initHour: _initHourController.text,
                              endHour: '',
                              sessions: _registrationStore.session.toInt(),
                              durationSession:
                                  _registrationStore.duration.toInt(),
                              isTask: widget.task!.isTask,
                            );
                            _registrationStore.updateTask(context, task);
                          }
                        },
                      ).create();
                    } else {
                      return ButtonAbstract(
                        nameButton: 'Salvar',
                        color: colorAppBar,
                        colorText: Colors.white,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _registrationStore.insertTask(context);
                          }
                        },
                      ).create();
                    }
                  }
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future<void> _selectDateTask(controller, context) async {
  final _date = await showDatePicker(
    locale: const Locale('pt', 'BR'),
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2015),
    lastDate: DateTime(2050),
  );
  String _dateFormat = DateFormat('dd/MM/yyyy').format(_date!);
  controller.text = _dateFormat;
  _registrationStore.setTaskDate(_dateFormat);
}

Future<void> _selectHourTask(controller, context) async {
  final _hourTask = await showTimePicker(
    context: context,
    initialTime: TimeOfDay.now(),
  );
  controller.text = _hourTask!.format(context);
}
