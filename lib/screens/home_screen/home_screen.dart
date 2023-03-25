import 'package:agenda/components/box/index.dart';
import 'package:agenda/comum/styles/consts.dart';
import 'package:agenda/factories/view/card_abstract.dart';
import 'package:agenda/screens/home_screen/widgets/calendar.dart';
import 'package:agenda/screens/new_task_screen/new_task_screen.dart';
import 'package:agenda/screens/stopwatch_screen.dart/stopwatch_screen.dart';
import 'package:agenda/stores/registration_store.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../calendar_screen/calendar_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _registrationStore = RegistrationStore();
  @override
  void initState() {
    _registrationStore.getTasksToday();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        toolbarHeight: 10.h,
        title: Box(
          width: 70.w,
          padding: EdgeInsets.only(left: 0.1.vmax),
          child: Column(
            children: [
              Text(
                'Performance+',
                style: GoogleFonts.getFont(
                  'Montserrat',
                  textStyle: TextStyle(
                    fontSize: 2.5.vmax,
                    color: colorAppBar,
                    fontWeight: FontWeight.w600,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const CalendarScreen()),
                (Route<dynamic> route) => false,
              );
            },
            tooltip: 'Visualizar calendário',
            icon: Icon(
              Icons.calendar_month,
              color: colorAppBar,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          width: 100.w,
          height: 100.h,
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Observer(builder: (_) {
                  if (_registrationStore.loadingTasks) {
                    return CircularProgressIndicator(
                      color: colorAppBar,
                    );
                  } else {
                    return Column(
                      children: [
                        const Box(
                          child: Calendar(),
                        ),
                        Box(
                          padding: EdgeInsets.only(left: 5.w, right: 5.w),
                          height: 30.h,
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(bottom: 4.vmax),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Tarefas do dia',
                                    style: GoogleFonts.getFont(
                                      'Montserrat',
                                      textStyle: TextStyle(
                                        fontSize: 2.2.vmax,
                                        fontWeight: FontWeight.w500,
                                        color: colorAppBar,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              _registrationStore.tasks.isEmpty
                                  ? Box(
                                      height: 20.h,
                                      width: 90.w,
                                      decoration: BoxDecoration(
                                        color: const Color(0xfff3f3f3),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(2.vmax),
                                        ),
                                      ),
                                      margin: EdgeInsets.only(
                                          left: 0.5.vmax, right: 0.5.vmax),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Icon(
                                            Icons.calendar_month_sharp,
                                            color: const Color(0xff8B9296),
                                            size: 3.5.vmax,
                                          ),
                                          Center(
                                            child: Text(
                                              'Até o momento, você não tem nenhuma tarefa para concluir',
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.getFont(
                                                'Montserrat',
                                                textStyle: TextStyle(
                                                  fontSize: 1.8.vmax,
                                                  fontWeight: FontWeight.w500,
                                                  color:
                                                      const Color(0xff1F2E36),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  : CarouselSlider(
                                      items:
                                          _registrationStore.tasks.map((index) {
                                        return Builder(
                                          builder: (BuildContext context) {
                                            return GestureDetector(
                                              onTap: () {
                                                if (index.isTask == 1) {
                                                  showModalBottomSheet(
                                                    context: context,
                                                    builder: (context) {
                                                      return SizedBox(
                                                        height: 20.h,
                                                        child: Center(
                                                          child: Column(
                                                            children: [
                                                              TextButton(
                                                                onPressed: () {
                                                                  _registrationStore
                                                                      .deleteTask(
                                                                          index
                                                                              .id!);
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                },
                                                                child: Text(
                                                                  'Concluir Lembrete',
                                                                  style: GoogleFonts
                                                                      .getFont(
                                                                    'Montserrat',
                                                                    textStyle:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          1.8.vmax,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              TextButton(
                                                                onPressed: () {
                                                                  Navigator.of(
                                                                          context)
                                                                      .pushAndRemoveUntil(
                                                                    MaterialPageRoute(
                                                                      builder:
                                                                          (context) =>
                                                                              NewTaskScreen(
                                                                        task:
                                                                            index,
                                                                      ),
                                                                    ),
                                                                    (Route<dynamic>
                                                                            route) =>
                                                                        false,
                                                                  );
                                                                },
                                                                child: Text(
                                                                  'Atualizar informações',
                                                                  style: GoogleFonts
                                                                      .getFont(
                                                                    'Montserrat',
                                                                    textStyle:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          1.8.vmax,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                } else {
                                                  Navigator.of(context)
                                                      .pushAndRemoveUntil(
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          StopWatchScreen(
                                                        task: index,
                                                      ),
                                                    ),
                                                    (Route<dynamic> route) =>
                                                        false,
                                                  );
                                                }
                                              },
                                              child: CardTaskAbstract(
                                                index.nameTask!,
                                                index.initHour,
                                                index.endHour,
                                                index,
                                                index.isTask,
                                                () {
                                                  _registrationStore
                                                      .deleteTask(index.id!);
                                                },
                                              ).create(context),
                                            );
                                          },
                                        );
                                      }).toList(),
                                      options: CarouselOptions(height: 20.h),
                                    )
                            ],
                          ),
                        ),
                      ],
                    );
                  }
                }),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const NewTaskScreen()),
            (Route<dynamic> route) => false,
          );
        },
        backgroundColor: colorAppBar,
        child: const Icon(Icons.add),
      ),
    );
  }
}
