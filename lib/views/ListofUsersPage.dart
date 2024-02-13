
import 'package:flutter/material.dart';
import 'package:info_app/models/themes.dart';
import 'package:info_app/services/api%20integration.dart';
import 'package:info_app/services/authentication.dart';
import 'package:info_app/views/userDetailsPage.dart';

class UsersList extends StatelessWidget {
   UsersList({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    fetchUserData();
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.yellow.shade100,
        elevation: 10,
        child: Column(
          children: [
            DrawerHeader(
                child: CircleAvatar(
              radius: 40,
              child: Icon(
                Icons.camera_alt,
                size: 30,
              ),
            )),
            ListTile(
              title: Text(userData!["email"]),
            ),
            ListTile(
              trailing: Icon(
                Icons.logout,
                color: Colors.black,
                size: 30,
              ),
              title: TextButton(
                onPressed: () {
                  signOut(context);
                },
                child: Text(
                  "Sign Out",
                  style: TextStyle(fontSize: 25, color: Colors.black),
                ),
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.yellow.shade100,
        centerTitle: true,
        title: Text("info_app",style: TextStyle(fontSize: 28,fontStyle: FontStyle.italic),),
        elevation: 7,
      ),
      body: SafeArea(
        child: FutureBuilder(
            future: getEmpDetails(),
            builder: (context, AsyncSnapshot snapshot) {
              if(snapshot.connectionState==ConnectionState.waiting){
                return Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasData) {
                return Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                            itemCount: snapshot.data["data"].length,
                            itemBuilder: (context, index) {
                              Map userData = snapshot.data["data"][index];
                              return SingleChildScrollView(
                                child: Container(
                                  height: 70,
                                  width: MediaQuery.of(context).size.width,
                                  margin: EdgeInsets.only(
                                      top: 10, right: 5, left: 5),
                                  decoration: BoxDecoration(
                                      color: index % 2 == 0
                                          ? Colors.yellow.shade200
                                          : index % 3 == 0 || index % 6 == 0
                                              ? Colors.pink.shade100
                                              : Colors.blue.shade100,
                                      border: Border.all(
                                          color: Colors.black, width: 1),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, left: 15),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          userData["employee_name"],
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        ElevatedButton(
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          UserDetails(
                                                              moreDetails:
                                                                  userData)));
                                            },
                                            child: Text("More Details"))
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                      )
                    ],
                  ),
                );
              } else {
                return Center(child: Text("Something went wrong"));
              }
            }),
      ),
    );
  }
}
