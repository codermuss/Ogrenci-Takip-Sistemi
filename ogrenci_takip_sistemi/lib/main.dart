import 'package:flutter/material.dart';
import 'package:ogrenci_takip_sistemi/models/student.dart';
import 'package:ogrenci_takip_sistemi/screens/student_add.dart';
import 'package:ogrenci_takip_sistemi/screens/student_update.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      routes: {
        StudentUpdate.routeName: (context) => StudentUpdate(),
      },
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State {
  List<Student> students = [
    Student.withId(1, "Mustafa", "Yılmaz", 100),
    Student.withId(2, "Murat", "Kasal", 50),
    Student.withId(3, "Burak", "Akyürek", 40),
    Student.withId(4, "Kazım", "Kara", 20),
    Student.withId(5, "Ahmet", "Çelik", 60),
  ];
  Student selectedStudent = Student.withId(0, " ", " ", 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Öğrenci Takip Sistemine Hoş Geldiniz"),
          centerTitle: true,
        ),
        body: buildBody());
  }

  Widget buildBody() {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
              itemCount: students.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(students[index].firstName +
                      " " +
                      (students[index].lastName)),
                  subtitle: Text("Sınavdan aldığı not: " +
                      students[index].grade.toString() +
                      " [" +
                      students[index].getStatus +
                      "]"),
                  leading: CircleAvatar(
                    backgroundImage:
                        NetworkImage(students[index].imgURL.toString()),
                  ),
                  trailing: buildStatusIcon(students[index].grade),
                  onTap: () {
                    setState(() {
                      //build'i bir daha çalıştırır.build Bir daha çalış o değişen yerleri ekrana çiz.
                      this.selectedStudent = students[index];
                    });
                  },
                  onLongPress: () {
                    print("Uzun Basıldı");
                  },
                );
              }),
        ),
        Text("Seçili Öğrenci " +
            selectedStudent.firstName +
            " " +
            selectedStudent.lastName),
        Row(
          children: <Widget>[
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child: RaisedButton(
                color: Colors.greenAccent,
                child: Row(
                  children: <Widget>[
                    Icon(Icons.add),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text("Yeni Öğrenci")
                  ],
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => StudentAdd(students)),
                  ).then((value) => setState(() {}));
                },
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child: RaisedButton(
                color: Colors.orange,
                child: Row(
                  children: <Widget>[
                    Icon(Icons.add),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text("Güncelle")
                  ],
                ),
                onPressed: () {
                  Navigator.pushNamed(context, StudentUpdate.routeName,
                          arguments: selectedStudent)
                      .then((value) => setState(() {}));
                },
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: RaisedButton(
                color: Colors.red,
                child: Row(
                  children: <Widget>[
                    Icon(Icons.add),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text("Sil")
                  ],
                ),
                onPressed: () {
                  print("Sil");
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildStatusIcon(int grade) {
    if (grade <= 40) {
      return Icon(Icons.clear);
    } else if (grade <= 50) {
      return Icon(Icons.album);
    } else if (grade > 50 && grade <= 100) {
      return Icon(Icons.done);
    } else {
      return Icon(Icons.circle);
    }
  }
}
/*
class A {
  void setState() {}
}

class B extends A {
  void herhangiBirWidgetYapanFonksiyon() {
    setState() {
      // B A'yı extend ettiği için burada bu fonksiyonu çağırabiliyorum. Dolayısıyla yukarıdaki _Home.. classı State 'i extend ettiği için set state fonksiyonunu kullanabilecek.
    }
  }
}
//build ekranın yeniden çizilmesi
*/
