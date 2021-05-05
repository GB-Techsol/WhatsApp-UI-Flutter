import 'dart:ffi';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_ui/screens/Calls_screen.dart';
import 'package:whatsapp_ui/screens/Camera_screen.dart';
import 'package:whatsapp_ui/screens/Chats_screen.dart';
import 'package:whatsapp_ui/screens/Status_screen.dart';

void main() {
  runApp(HomeScreen());
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  Void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, initialIndex: 1, length: 4);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
          home: Scaffold(
        appBar: AppBar(
          title: Text('WhatsApp'),
          elevation: 10.0,
          backgroundColor: new Color(0xff075E54),
          bottom: new TabBar(
            labelPadding: EdgeInsets.all(5.0),
            controller: _tabController,
            indicatorColor: Colors.white,
            tabs: [
              Tab(
                icon: Icon(Icons.camera_alt),
              ),
              Tab(text: "CHATS"),
              Tab(text: "STATUS"),
              Tab(text: "CALLS"),
            ],
          ),
          actions: [
            Icon(Icons.search),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 5.0),),
            Icon(Icons.more_vert),
          ],
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            CameraScreen(),
            ChatScreen(),
            StatusScreen(),
            CallsScreen(),
          ],
        ),
          floatingActionButton: FloatingActionButton(
          backgroundColor: new Color(0xff075E54),
          child: Icon(Icons.message),
          onPressed: () => print("Open Chats"),
        ),
      ),
    );
  }
}