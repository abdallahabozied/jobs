extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}

class Animal {
  final int? id;
  final String? name;

  Animal({
    this.id,
    this.name,
  });
}

class Job_Type {
  final int? id;
  final String? name;

  Job_Type({
    this.id,
    this.name,
  });
}
