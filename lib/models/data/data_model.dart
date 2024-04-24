class DataModel {
  final int? id;
  final String? name;
  final String? number;
  final String? age;
  final String? address;

  DataModel({
    this.id,
    this.name,
    this.number,
    this.age,
    this.address,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'number': number,
      'age': age,
      'address': address,
    };
  }

  factory DataModel.fromMap(Map<String, dynamic> map) {
    return DataModel(
      id: map['id'],
      name: map['name'],
      number: map['number'],
      age: map['age'],
      address: map['address'],
    );
  }
}
