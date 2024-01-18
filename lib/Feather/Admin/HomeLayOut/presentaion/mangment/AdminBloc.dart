import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feather/Admin/HomeLayOut/presentaion/mangment/AdminState.dart';
import 'package:flutter_application_1/Feather/Admin/HomeLayOut/presentaion/views/Alluser/views/Alluser.dart';
import 'package:flutter_application_1/Feather/Admin/HomeLayOut/presentaion/views/Widgets/Home/home.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/views/chat.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminBloc extends Cubit<AdminState> {
  AdminBloc() : super(InitalState());
  static AdminBloc get(context) => BlocProvider.of(context);
  int currentindex = 0;
  List<QueryDocumentSnapshot> dataconsult = [];

  List<QueryDocumentSnapshot> dataclient = [];
  List<Widget> views = [
    const Home(),
    const ChatScreen(),
    const AllUser(),
  ];

  void changeBootomSheet(int index) {
    currentindex = index;
    emit(ChangeBottonSheet());
  }

  ThemeMode themeMode = ThemeMode.light;
  void changeTheam(ThemeMode mode) {
    themeMode = mode;
    emit(ChangeTheamMode());
  }

  userconsulting() async {
    CollectionReference user =
        await FirebaseFirestore.instance.collection('user');

    QuerySnapshot consultingdata =
        await user.where('type', isEqualTo: 'consulting').get();
    consultingdata.docs.forEach((element) {
      dataconsult.add(element);
    });
    
    emit(Changeuser());
  }

  userclient() async {
    CollectionReference user =
        await FirebaseFirestore.instance.collection('user');

    QuerySnapshot consultingdata =
        await user.where('type', isEqualTo: 'client').get();
    consultingdata.docs.forEach((element) {
      dataclient.add(element);
    });
    emit(Changeuser());
  }
}
