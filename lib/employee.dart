class Employee {
  int _id;
  String _name;
  double _salary;

  Employee(this._id, this._name, this._salary);

  int get id => _id;
  String get name => _name;
  double get salary => _salary;

  set id(int value) {
    this._id = value;
  }

  set name(String value) {
    this._name = value;
  }

  set salary(double value) {
    this._salary = value;
  }
}
