class User {
  final String? name;
  final int? age;
  late scrollcontroller s;

  User({required this.name, required this.age}) {
    s = scrollcontroller(n: 0);
  }

  void printee() {
    s.printee();
  }

  User CopyWith({String? name, int? age}) {
    User newUser = User(name: name ?? this.name, age: age ?? this.age);
    newUser.s = this.s; // keep the same scrollcontroller
    return newUser;
  }
}

class scrollcontroller {
  int n;
  scrollcontroller({required this.n});
  void printee() {
    print(n);
  }
}

void main() {
  User u1 = User(name: "Hari", age: 33);
  u1.printee(); // prints 0

  u1 = u1.CopyWith(name: "Ram", age: 33);
  u1.printee(); // prints 0 again, controller preserved

  print(u1.name); // prints "Ram"
}
