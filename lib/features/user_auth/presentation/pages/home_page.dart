
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'desconto.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List _pages = [
    HomeScreen(), // Cria uma nova tela
    desconto(),
  ];

  void _navigationBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: const Color.fromARGB(255, 51, 97, 250),
        color: const Color.fromARGB(255, 138, 206, 50),
        animationDuration: Duration(milliseconds: 100),
        index: _selectedIndex,
        onTap: _navigationBottomBar,
        items: [
          Icon(Icons.home),
          Icon(Icons.attach_money)
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Home Screen'),
    );
  }
}
class UserModel {
  final String? username;
  final String? adress;
  final int? age;
  final String? id;

  UserModel({this.id, this.username, this.adress, this.age});

  static UserModel fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    return UserModel(
      username: snapshot['username'],
      adress: snapshot['adress'],
      age: snapshot['age'],
      id: snapshot['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "username": username,
      "age": age,
      "id": id,
      "adress": adress,
    };
  }
}