import 'package:flutter/material.dart';
import 'employee.dart';
import 'employee_bloc.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _employeeBloc = EmployeeBloc();

  @override
  void dispose() {
    _employeeBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Employees'),
        backgroundColor: Colors.deepPurple,
      ),
      body: StreamBuilder<List<Employee>>(
        stream: _employeeBloc.employeeListStream,
        builder:
            (BuildContext context, AsyncSnapshot<List<Employee>> snapshot) {
          return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          '${snapshot.data[index].id}.',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(bottom: 5, top: 10),
                            child: Text(
                              '${snapshot.data[index].name}',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 10, bottom: 10),
                            child: Text(
                              '₨ ${snapshot.data[index].salary}',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        child: IconButton(
                          icon: Icon(Icons.thumb_up),
                          color: Colors.green,
                          onPressed: () {
                            _employeeBloc.employeeSalaryIncrement
                                .add(snapshot.data[index]);
                          },
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        child: IconButton(
                          icon: Icon(Icons.thumb_down),
                          color: Colors.red,
                          onPressed: () {
                            _employeeBloc.employeeSalaryDecrement
                                .add(snapshot.data[index]);
                          },
                        ),
                      ),
                    ],
                  ),
                );
              });
        },
      ),
    );
  }
}
