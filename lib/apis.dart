import 'package:http/http.dart' as http;
import 'dart:convert';

// Método para obtener datos de la primera API
Future<List<dynamic>> fetchData() async {
  final response = await http.get(Uri.parse('http://localhost:8000/api/datos'));

  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    return [];
  }
}

// Método para obtener datos de la segunda API
Future<List<dynamic>> fetchMachineData() async {
  final response = await http.get(Uri.parse('http://localhost:8000/api/maquinas'));

  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    return [];
  }
}

// Método para obtener datos de la tercera API
Future<List<dynamic>> fetchTipoProcesoData() async {
  final response = await http.get(Uri.parse('http://localhost:8000/api/TipoProceso'));

  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    return [];
  }
}
