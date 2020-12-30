class Employee {
  final String firstName;
  final String lastName;
  final String middleName;
  final String rank;
  final String photoLink;
  final String calendarId;
  final List<String> academicDepartment;
  final int id;
  final String fio;

  Employee(
      {this.firstName,
      this.lastName,
      this.middleName,
      this.rank,
      this.photoLink,
      this.calendarId,
      this.academicDepartment,
      this.id,
      this.fio});

  factory Employee.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;

    return Employee(
      firstName: json['firstName'],
      lastName: json['lastName'],
      middleName: json['middleName'],
      rank: json['rank'],
      photoLink: json['photoLink'],
      calendarId: json['calendarId'],
      academicDepartment: List<String>.from(json['academicDepartment']),
      id: json['id'],
      fio: json['fio'],
    );
  }
}
