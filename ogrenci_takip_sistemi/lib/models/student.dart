class Student {
  int id;
  String firstName;
  String lastName;
  int grade;
  String status;
  String imgURL =
      "https://i.pinimg.com/originals/20/80/15/208015eb47d71e6fd2363c1d9e90b220.jpg";

  Student({String firstName, String lastName, int grade}) {
    this.firstName = firstName;
    this.lastName = lastName;
    this.grade = grade;
  }
  //named Constructor
  Student.withId(int id, String firstName, String lastName, int grade) {
    this.id = id;
    this.firstName = firstName;
    this.lastName = lastName;
    this.grade = grade;
  }
  String get getStatus {
    this.status = "Notlandırma Mevcut Değil";
    if (this.grade <= 40) {
      this.status = "Kaldi";
    } else if (this.grade <= 50) {
      this.status = "Koşullu Geçti";
    } else if (this.grade > 50 && this.grade <= 100) {
      this.status = "Geçti";
    }
    return this.status;
  }
}
