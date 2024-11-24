import 'package:flutter/material.dart';
import "package:calculador/customtextfield.dart";
import 'package:calculador/calcularlimpiar.dart';
import 'package:calculador/logica.dart';

class Desktop extends StatefulWidget {
  const Desktop({super.key});

  @override
  State<Desktop> createState() => _DesktopState();
}

class _DesktopState extends State<Desktop> {
  final TextEditingController montoController = TextEditingController();
  final TextEditingController mesesController = TextEditingController();
  final TextEditingController tasaController = TextEditingController();

  double cuotaMensual = 0.0; // Variable para mostrar el resultado

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ITLA Calculadora",
          style: TextStyle(
            fontSize: 40,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue[800],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Contenedor del título
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.15,
              decoration: BoxDecoration(color: Colors.blue[800]),
              child: const Text(
                "Calculadora de Préstamos Personales",
                style: TextStyle(fontSize: 35, color: Colors.white),
              ),
            ),
            const SizedBox(height: 50),

            // Formulario
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Lado izquierdo: Formulario de entrada
                Expanded(
                  flex: 2,
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 50),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.blue[800],
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Monto Solicitado
                        const Text(
                          "Monto Solicitado RD\$*",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        Card(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: CustomTextField(
                            hintText: "0.00",
                            controller: montoController,
                          ),
                        ),
                        const SizedBox(height: 30),

                        // Duración
                        const Text(
                          "Duración*",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        Card(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: CustomTextField(
                            hintText: "Cantidad de meses",
                            controller: mesesController,
                          ),
                        ),
                        const SizedBox(height: 30),

                        // Tasa de Interés
                        const Text(
                          "Tasa de interés*",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        Card(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: CustomTextField(
                            hintText: "%",
                            controller: tasaController,
                          ),
                        ),
                        const SizedBox(height: 40),

                        // Botones
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CalcularLimpiar(
                              texto: "Limpiar",
                              onPressed: () {
                                setState(() {
                                  montoController.clear();
                                  mesesController.clear();
                                  tasaController.clear();
                                  cuotaMensual = 0.0;
                                });
                              },
                            ),
                            CalcularLimpiar(
                              texto: "Calcular",
                              onPressed: () {
                                double monto =
                                    double.tryParse(montoController.text) ??
                                        0.0;
                                int meses =
                                    int.tryParse(mesesController.text) ?? 0;
                                double tasa =
                                    double.tryParse(tasaController.text) ?? 0.0;

                                if (monto <= 0 || meses <= 0 || tasa < 0) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            "Por favor, ingrese valores válidos.")),
                                  );
                                  return;
                                }

                                setState(() {
                                  cuotaMensual =
                                      calcularCuotaMensual(monto, tasa, meses);
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                // Lado derecho: Resultado
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 50),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.blue[100],
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Cuota Mensual",
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "RD\$${cuotaMensual.toStringAsFixed(2)}",
                          style: const TextStyle(
                              fontSize: 30,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
