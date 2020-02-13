import 'employee.dart';
import 'dart:async';

class EmployeeBloc {
  List<Employee> _employeeList = [
    Employee(1, 'Employee 1', 1000.0),
    Employee(2, 'Employee 2', 2000.0),
    Employee(3, 'Employee 3', 3000.0),
    Employee(4, 'Employee 4', 4000.0),
    Employee(5, 'Employee 5', 5000.0),
    Employee(6, 'Employee 6', 6000.0),
    Employee(7, 'Employee 7', 7000.0),
    Employee(8, 'Employee 8', 8000.0),
    Employee(9, 'Employee 9', 9000.0),
  ];

  final _employeeListStreamController = StreamController<List<Employee>>();

  final _employeeSalaryIncrementStreamController = StreamController<Employee>();
  final _employeeSalaryDecrementStreamController = StreamController<Employee>();

  Stream<List<Employee>> get employeeListStream =>
      _employeeListStreamController.stream;

  StreamSink<List<Employee>> get employeeListSink =>
      _employeeListStreamController.sink;

  StreamSink<Employee> get employeeSalaryIncrement =>
      _employeeSalaryIncrementStreamController.sink;
  StreamSink<Employee> get employeeSalaryDecrement =>
      _employeeSalaryDecrementStreamController.sink;

  EmployeeBloc() {
    _employeeListStreamController.add(_employeeList);

    _employeeSalaryIncrementStreamController.stream.listen(_incrementSalary);
    _employeeSalaryDecrementStreamController.stream.listen(_decrementSalary);
  }

  _incrementSalary(Employee employee) {
    double salary = employee.salary;
    double incrementedSalary = salary * 20 / 100;
    _employeeList[employee.id - 1].salary = salary + incrementedSalary;
    employeeListSink.add(_employeeList);
  }

  _decrementSalary(Employee employee) {
    double salary = employee.salary;
    double decrementedSalary = salary * 20 / 100;
    _employeeList[employee.id - 1].salary = salary - decrementedSalary;
    employeeListSink.add(_employeeList);
  }

  void dispose() {
    _employeeListStreamController.close();
    _employeeSalaryIncrementStreamController.close();
    _employeeSalaryDecrementStreamController.close();
  }
}
