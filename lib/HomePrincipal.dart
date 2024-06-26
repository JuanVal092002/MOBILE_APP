import 'package:flutter/material.dart';
import 'maquina1.dart'; // Importación de la página Maquina1Page
import 'seguimiento.dart'; 

class HomePrincipal extends StatefulWidget {
  const HomePrincipal({super.key});

  @override
  _HomePrincipalState createState() => _HomePrincipalState();
}

class _HomePrincipalState extends State<HomePrincipal> {
  String? _selectedMaquina; // Estado para almacenar la máquina seleccionada

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Coffee App'),
        backgroundColor: Color.fromARGB(255, 0, 0, 116), 
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Seleccione la maquina a usar en el proceso'), 
              SizedBox(height: 8.0), // Espacio entre el texto y los botones de máquina
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(5, (index) {
                  int machineNumber = index + 1;
                  return ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _selectedMaquina = 'Maquina $machineNumber'; // Actualiza el estado con la máquina seleccionada
                      });
                      if (machineNumber == 1) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Maquina1Page()), // Navega a la página Maquina1Page al hacer clic en la máquina 1
                        );
                      }
                    },
                    child: Text('$machineNumber'), // Texto del botón con el número de máquina
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(), // Forma del botón (círculo)
                      backgroundColor: _selectedMaquina == 'Maquina $machineNumber' ? Colors.lightBlue : null, // Color de fondo del botón
                    ),
                  );
                }),
              ),
              SizedBox(height: 16.0),  // Añade un espacio entre los botones y el botón de seguimiento
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SeguimientoPage()), // Navega a la página SeguimientoPage al hacer clic en el botón de seguimiento
                  );
                },
                child: Text('Seguimiento'), // Texto del botón de seguimiento
              ),
            ],
          ),
        ),
      ),
    );
  }
}
