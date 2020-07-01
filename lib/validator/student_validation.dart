class StudentValidationMixin{
  String validateFirstName(String value) {
    if(value.length < 2) {
      return "First name must be at least 3 character";
    }
  }

  String validateLastName(String value) {
    if(value.length < 2) {
      return "Last name must be at least 3 character";
    }
  }

  String validateGrade(String value) {
    int grade = int.parse(value);
    if(grade < 0 || grade > 100) {
      return "Grade must be in range 0-100";
    }
  }
}