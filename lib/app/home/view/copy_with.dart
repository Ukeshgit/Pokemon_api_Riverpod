class User {
  final String? name;
  final int? age;
  User({required this.name, required this.age});

  User CopyWith({String? name, int? age}) {
    return User(
      name: name ?? this.name,
      age: age ?? this.age,
    ); //name liney tala bata deko natra mathi kai name liney
  }
}

void main() {
  User u1 = User(name: "Hari", age: 33);
  // u1.name = "Ram"; //can't change value of object like this since it is immuatable
  print(u1.name);

  u1 = u1.CopyWith(name: "Ram", age: 33);
  print(u1.name);
}
