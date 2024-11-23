

import 'package:flutter/material.dart';
import 'package:calculador/customtextfield.dart';
import 'package:calculador/calcularlimpiar.dart';

class Desktop extends StatelessWidget {
  const Desktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ITLA Calculadora",
        style: TextStyle(
          color: Colors.white,
          fontSize: 40
        ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue[800],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
        
            //contenedor del calculadora de prestamos personales
            Container(alignment: Alignment.center,
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.blue[800]
              ),
              child: Text("Calculadora de Prestamos Personales",
              style: TextStyle(
                fontSize: 35,
                color: Colors.white
              ),),
            ),
            SizedBox(
              height: 80,
            ),
        
            Form(
              child: Row(
                children: [
                  //expanded del lado izquierdo
                  Expanded(
                    flex: 2,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 100),
                      width: 200,
                      height: 600,
                      decoration: BoxDecoration(
                        color: Colors.blue[800],
                        borderRadius: BorderRadius.circular(25)
                      ),
                      child: Column(
                        children: [
                          //primer contenedor personales
                          Container(alignment: Alignment.topLeft,
                          padding: EdgeInsets.only(left: 50, top: 10),
                            child: Text("Personales",
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                            ),
                            ),
                          ),
              
                          SizedBox(height: 10),

                          Container(
                            child: Text("Monto Solicitado RD\$*",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20
                            ),),
                          ),
                          SizedBox(height: 7),

                         
                          Card(margin: EdgeInsets.symmetric(horizontal: 30),
                            child: CustomTextField(hintText: "0.00", )),



                          
                          SizedBox(height: 60),













                          //duracion

                          Container(
                            child: Text("Duración*",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20
                            ),),
                          ),
                          SizedBox(height: 7),


                          Card(margin: EdgeInsets.symmetric(horizontal: 30),
                            child: CustomTextField(hintText: "Cantidad de meses", )),


                          
                          SizedBox(height: 60),













                          
                          //tasa de interes

                          Container(
                            child: Text("Tasa de interés*",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20
                            ),),
                          ),
                          SizedBox(height: 7),


                          Card(margin: EdgeInsets.symmetric(horizontal: 30),
                            child: CustomTextField(hintText: "%", )),

                          SizedBox(height: 60),



              

                        Row(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CalcularLimpiar(texto: "Limpiar", onPressed: (){}),
                            SizedBox(width: 10),
                            CalcularLimpiar(texto: "Calcular", onPressed: (){})

                          ],
                        ),
                      


              
                        ],
                        
                        
                      
                      ),
                    ),
                    
                    ),
              
                      
                      
                    //expanded del lado derecho
                    Expanded(
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 50),
                        width: 50,
                        height: 350,
                        decoration: BoxDecoration(
                          color: Colors.blue[100],
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Column(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Cuota Mensual",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold
                            ),
                            ),


                            Text("RD\$0.00",
                            style: TextStyle(
                              fontSize: 28,
                              color: Colors.black,
                              fontWeight: FontWeight.bold
                            ),
                            ),

              




                            

                          ],
                        ),
                      
                    ),
                    ),

                    

                      
                ],
                
                      
              ),
            ),
        
          ],
        ),
      ),





    );
  }
}

