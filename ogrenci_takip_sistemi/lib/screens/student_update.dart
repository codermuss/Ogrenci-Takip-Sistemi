import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ogrenci_takip_sistemi/models/student.dart';

class StudentUpdate extends StatefulWidget {
  static String routeName = "/routeStudentUpdate";
  @override
  State<StatefulWidget> createState() {
    return _StudentUpdateState();
  }
}

class _StudentUpdateState extends State {
  var adDeger = TextEditingController();
  var soyadDeger = TextEditingController();
  var notDeger = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Student selectedStudent = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Öğrenci Güncelle"),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(15.0),
            // color: Colors.orange,
            child: buildTextFormField(selectedStudent, "Ad"),
          ),
          Container(
            padding: EdgeInsets.all(15.0),
            child: buildTextFormField(selectedStudent, "Soyad"),
          ),
          Container(
            padding: EdgeInsets.all(15.0),
            child: buildTextFormField(selectedStudent, ""),
          ),
          SizedBox(
            height: 15.0,
          ),
          Container(
            child: FlatButton(
              color: Colors.blue,
              onPressed: () {
                Navigator.pop(context);
                selectedStudent.firstName = adDeger.text != ""
                    ? adDeger.text
                    : selectedStudent.firstName;
                selectedStudent.lastName = soyadDeger.text != ""
                    ? soyadDeger.text
                    : selectedStudent.lastName;
                selectedStudent.grade = int.parse(notDeger.text != ""
                    ? notDeger.text
                    : selectedStudent.grade);
              },
              child: Text(
                "Güncelle",
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  TextFormField buildTextFormField(Student selectedStudent, String kriter) {
    return TextFormField(
      controller: kriter == "Ad"
          ? adDeger
          : kriter == "Soyad"
              ? soyadDeger
              : notDeger,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: BorderSide(color: Colors.blue),
        ),
        labelText:
            "Öğrenci ${kriter == "Ad" ? "Adı" : kriter == "Soyad" ? "Soyadı" : "Notu"}",
        hintText:
            "${kriter == "Ad" ? selectedStudent.firstName : kriter == "Soyad" ? selectedStudent.lastName : selectedStudent.grade}",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
    );
  }
}
