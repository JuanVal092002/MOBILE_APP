import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // para decodificar la respuesta JSON

class Maquina1Page extends StatefulWidget {
  @override
  _Maquina1PageState createState() => _Maquina1PageState();
}

class _Maquina1PageState extends State<Maquina1Page> {
  List<dynamic> data = []; // Lista para almacenar los datos de la primera API
  List<dynamic> machineData = []; // Lista para almacenar los datos de la segunda API
  List<dynamic> tipoProcesoData = []; // Lista para almacenar los datos de la tercera API

  @override
  void initState() {
    super.initState();
    fetchData();
    fetchMachineData();
    fetchTipoProcesoData();
  }

  // Método para obtener datos de la primera API
  Future<void> fetchData() async {
    final response = await http.get(Uri.parse('http://localhost:8000/api/datos'));

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

  // Método para obtener datos de la segunda API
  Future<void> fetchMachineData() async {
    final response = await http.get(Uri.parse('http://localhost:8000/api/maquinas'));

    if (response.statusCode == 200) {
      setState(() {
        machineData = json.decode(response.body);
      });
    } else {
      setState(() {
        machineData = [];
      });
    }
  }

  // Método para obtener datos de la tercera API
  Future<void> fetchTipoProcesoData() async {
    final response = await http.get(Uri.parse('http://localhost:8000/api/TipoProceso'));

    if (response.statusCode == 200) {
      setState(() {
        tipoProcesoData = json.decode(response.body);
      });
    } else {
      setState(() {
        tipoProcesoData = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Maquina1'),
        backgroundColor: Color.fromARGB(255, 0, 0, 116),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          // Mostrar datos de la primera API
          data.isEmpty
              ? Center(child: Text('Loading datos...'))
              : Column(
                  children: data.map((item) {
                    return ListTile(
                      title: Text('Temperatura: ${item["temperatura"]}'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('ID Máquina: ${item["idMaquina"]}'),
                          Text('temperatura_s1: ${item["temperatura_s1"]}'),
                          Text('temperatura_s2: ${item["temperatura_s2"]}'),
                        ],
                      ),
                    );
                  }).toList(),
                ),
          // Espacio entre las secciones de las APIs
          SizedBox(height: 16.0),
          // Mostrar datos de la segunda API (maquinas)
          machineData.isEmpty
              ? Center(child: Text('Loading machine data...'))
              : Column(
                  children: machineData.map((item) {
                    return ListTile(
                      title: Text('ID Máquina: ${item["id"]}'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Descripción: ${item["nombre"]}'),
                          Text('Estado: ${item["estado"]}'),
                        ],
                      ),
                    );
                  }).toList(),
                ),
          // Espacio entre las secciones de las APIs
          SizedBox(height: 16.0),
          // Mostrar datos de la tercera API (TipoProceso)
          tipoProcesoData.isEmpty
              ? Center(child: Text('Loading tipo proceso data...'))
              : Column(
                  children: tipoProcesoData.map((item) {
                    return ListTile(
                      title: Text('ID Tipo Proceso: ${item["_id"]}'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          
                          Text('Nombre: ${item["nombre"]}'),
                          
                        ],
                      ),
                    );
                  }).toList(),
                ),
        ],
      ),
    );
  }
}
