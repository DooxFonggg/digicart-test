class TestModel {
  String? name;
  int? age;

  TestModel({this.name, this.age});

  factory TestModel.fromJson(Map<String, dynamic> json) {
    return TestModel(
      name: json['name'],
      age: json['age'],
    );
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'age': age,
  };

  @override
  String toString() {
    return 'TestModel{name: $name, age: $age}';
  }
}