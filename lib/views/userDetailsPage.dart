
import 'package:flutter/material.dart';
import 'package:info_app/models/themes.dart';

class UserDetails extends StatelessWidget {
  Map moreDetails;
  UserDetails({
    required this.moreDetails,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation:5,title: Text("UserDetails",style: buttonText,),centerTitle: true,),
      body: SafeArea(
          child: Card(
            elevation: 10,
            child: Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(top: 10, right: 5, left: 5),
                    decoration: BoxDecoration(
gradient: LinearGradient(colors: [Colors.yellow.shade100,Colors.yellow.shade200,Colors.yellow.shade200,Colors.yellow.shade50]),
              // color: Colors.yellow.shade200,
              border: Border.all(color: Colors.black, width: 1),
              borderRadius: BorderRadius.circular(10)),
                    child: Padding(
            padding: const EdgeInsets.only(top: 10, left: 15),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Name :",style:textStyle,),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      moreDetails["employee_name"],
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Age :",style:textStyle),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      moreDetails["employee_age"].toString(),
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Salary :",style:textStyle),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      moreDetails["employee_salary"].toString(),
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Address :",style:textStyle),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "hello world",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Phone Number :",style:textStyle),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "12345678",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ],
                ),
              ],
            ),
                    ),
                  ),
          )),
    );
  }
}
