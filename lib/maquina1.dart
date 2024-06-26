import 'package:flutter/material.dart';
import 'apis.dart';

class Maquina1Page extends StatefulWidget {
  @override
  _Maquina1PageState createState() => _Maquina1PageState();
}

class _Maquina1PageState extends State<Maquina1Page> {
  List<dynamic> data = []; // Lista para almacenar los datos de la primera API
  List<dynamic> machineData =
      []; // Lista para almacenar los datos de la segunda API
  List<dynamic> tipoProcesoData =
      []; // Lista para almacenar los datos de la tercera API

  @override
  void initState() {
    super.initState();
    fetchDataFromApis();
  }

  // Método para obtener datos de las APIs
  Future<void> fetchDataFromApis() async {
    final dataResult = await fetchData();
    final machineDataResult = await fetchMachineData();
    final tipoProcesoDataResult = await fetchTipoProcesoData();

    setState(() {
      data = dataResult;
      machineData = machineDataResult;
      tipoProcesoData = tipoProcesoDataResult;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Maquina1',style: TextStyle(color: Colors.white),),
        backgroundColor: Color.fromARGB(255, 0, 0, 116),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          _buildSectionCard('Datos', data, (item) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Temperatura: ${item["temperatura"]}'),
                Text('ID Máquina: ${item["idMaquina"]}'),
                Text('temperatura_s1: ${item["temperatura_s1"]}'),
                Text('temperatura_s2: ${item["temperatura_s2"]}'),
              ],
            );
          }),
          SizedBox(height: 16.0),
          _buildSectionCard('Máquinas', machineData, (item) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('ID Máquina: ${item["id"]}'),
                Text('Descripción: ${item["nombre"]}'),
                Text('Estado: ${item["estado"]}'),
              ],
            );
          }),
          SizedBox(height: 16.0),
          _buildSectionCard('Tipo de Proceso', tipoProcesoData, (item) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('ID Tipo Proceso: ${item["_id"]}'),
                Text('Nombre: ${item["nombre"]}'),
              ],
            );
          }),
        ],
      ),
    );
  }

  Widget _buildSectionCard(
      String title, List<dynamic> data, Widget Function(dynamic) itemBuilder) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Divider(color: Colors.grey),
            ...data.map((item) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: itemBuilder(item),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
