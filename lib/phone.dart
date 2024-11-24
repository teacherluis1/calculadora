import 'package:flutter/material.dart';
import 'package:calculador/customtextfield.dart';
import 'package:calculador/calcularlimpiar.dart';
import 'package:calculador/logica.dart';

class Phone extends StatefulWidget {
  const Phone({super.key});

  @override
  State<Phone> createState() => _PhoneState();
}

class _PhoneState extends State<Phone> {
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
          style: TextStyle(fontSize: 40, color: Colors.white),
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
              decoration:  BoxDecoration(color: Colors.blue[800]),
              child: const Text(
                "Calculadora de Préstamos Personales",
                style: TextStyle(fontSize: 28, color: Colors.white),
              ),
            ),
            const SizedBox(height: 40),

            // Formulario
            Form(
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.55,
                    decoration: BoxDecoration(
                      color: Colors.blue[800],
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Column(
                      children: [
                        // Monto Solicitado
                        const Text(
                          "Monto Solicitado RD\$*",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        Card(
                          margin: const EdgeInsets.symmetric(horizontal: 30),
                          child: CustomTextField(
                            hintText: "0.00",
                            controller: montoController,
                          ),
                        ),
                        const SizedBox(height: 40),

                        // Duración
                        const Text(
                          "Duración*",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        Card(
                          margin: const EdgeInsets.symmetric(horizontal: 30),
                          child: CustomTextField(
                            hintText: "Cantidad de meses",
                            controller: mesesController,
                          ),
                        ),
                        const SizedBox(height: 40),

                        // Tasa de Interés
                        const Text(
                          "Tasa de interés*",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        Card(
                          margin: const EdgeInsets.symmetric(horizontal: 30),
                          child: CustomTextField(
                            hintText: "%",
                            controller: tasaController,
                          ),
                        ),
                        const SizedBox(height: 40),

                        // Botones
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
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
                            const SizedBox(width: 10),
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
                  const SizedBox(height: 50),

                  // Resultado
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 50),
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: MediaQuery.of(context).size.height * 0.2,
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
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "RD\$${cuotaMensual.toStringAsFixed(2)}",
                          style: const TextStyle(
                            fontSize: 28,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 20,
              height: 100,
            )
            
          ],
        ),
      ),
    );
  }
}
