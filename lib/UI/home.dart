import 'package:flutter/material.dart';
import 'package:flutter_todo/Model/firestore.dart';
import 'package:flutter_todo/Model/userModel.dart';

class HomePage extends StatelessWidget {
  String uid;
  HomePage({required this.uid});

  FireStoreService _service = FireStoreService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          FutureBuilder(
              future: _service.getData(uid),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text("Error");
                } else if (snapshot.hasError) {
                  return Text("Error");
                } else {
                  UserModel? user = snapshot!.data;
                  return SizedBox(
                    width: 300,
                    height: 80,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.withOpacity(0.5),
                      ),
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Text('Full Name :  + ${user?.fullName}'),
                          Text('User Name :  + ${user?.userName}'),
                          Text('Gender :  + ${user?.Gender}'),
                          Text('Email :  + ${user?.email}'),
                        ],
                      ),
                    ),
                  );
                }
              }),
        ],
      ),
    );
  }
}
