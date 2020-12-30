class StudentGroup {
  final String name;
  final int facultyId;
  final int specialityDepartmentEducationFormId;
  final int course;
  final int id;
  final String calendarId;

  StudentGroup(
      {this.name,
      this.facultyId,
      this.specialityDepartmentEducationFormId,
      this.course,
      this.id,
      this.calendarId});

  factory StudentGroup.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;

    return StudentGroup(
      name: json['name'],
      facultyId: json['facultyId'],
      specialityDepartmentEducationFormId:
          json['specialityDepartmentEducationFormId'],
      course: json['course'],
      id: json['id'],
      calendarId: json['calendarId'],
    );
  }
}
