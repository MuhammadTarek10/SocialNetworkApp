import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:social_network_app/widgets/header.dart';
import 'package:social_network_app/widgets/progress.dart';



final usersRef = FirebaseFirestore.instance.collection('users');

class Timeline extends StatefulWidget {
  @override
  _TimelineState createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {

  @override
  void initState() {
    getUsers();
    super.initState();
  }

  getUsers() async {
    final QuerySnapshot snapshot = await usersRef
        .get();
    snapshot.docs.forEach((DocumentSnapshot doc) {
      print(doc.data());
    });
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: header(context, isAppTitle: true),
      body: linearProgress(),
    );
  }
}
