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
        title: Text('Seguimiento'),
        backgroundColor: Color.fromARGB(255, 0, 0, 116),
      ),
      body: Center(
        child: data.isEmpty
            ? Text('Loading...')
            : ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Seguimiento'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('id proceso: ${data[index]["idProceso"]}'),
                        Text('Fecha: ${data[index]["fecha"]}'),
                        Text('estado: ${data[index]["estado"]}'),
                        Text('maquina: ${data[index]["maquina"]}'),
                        Text('usuarios: ${data[index]["usuarios"]}'),
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }
}
