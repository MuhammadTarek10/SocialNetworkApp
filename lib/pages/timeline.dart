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
  void initState(){

    super.initState();
  }


  @override
  Widget build(context) {
    return Scaffold(
        appBar: header(context, isAppTitle: true),
        body: StreamBuilder<QuerySnapshot>(
          stream: usersRef.snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return circularProgress();
            }
            final children = snapshot.data!.docs.map((doc) => Text(doc['username'])).toList();
            return Container(
              child: ListView(
                children: children,
              ),
            );
          },
        )
    );
  }
}
