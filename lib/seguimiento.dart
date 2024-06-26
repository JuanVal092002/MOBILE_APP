import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SeguimientoPage extends StatefulWidget {
  @override
  _SeguimientoPageState createState() => _SeguimientoPageState();
}

class _SeguimientoPageState extends State<SeguimientoPage> {
  List<dynamic> data = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response =
        await http.get(Uri.parse('http://localhost:8000/api/seguimiento'));

    if (response.statusCode == 200) {
      setState(() {
        data = json.decode(response.body);
      });
    } else {
      setState(() {
        data = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Seguimiento',style: TextStyle(color: Colors.white),),
        backgroundColor: Color.fromARGB(255, 0, 0, 116),
          iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Center(
        child: data.isEmpty
            ? CircularProgressIndicator() // Indicador de carga
            : ListView.builder(
                padding: EdgeInsets.all(16.0),
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.grey[200],
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Seguimiento',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text('ID Proceso: ${data[index]["idProceso"]}'),
                          Text('Fecha: ${data[index]["fecha"]}'),
                          Text('Estado: ${data[index]["estado"]}'),
                          Text('Máquina: ${data[index]["maquina"]}'),
                          Text('Usuarios: ${data[index]["usuarios"]}'),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
