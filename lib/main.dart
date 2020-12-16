import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Home()));
}

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController alcoolController = TextEditingController();
  final TextEditingController gasolinaController = TextEditingController();
  String _resultado = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Alcool vs Gasolina"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: 50.0, bottom: 30.0),
                width: 80.0,
                height: 80.0,
                child: Image(image: AssetImage("images/gas.png")),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: TextField(
                  controller: alcoolController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Valor do Alcool",
                      prefix: Text("R\$ "),
                      labelStyle: TextStyle(
                        color: Colors.blue[800],
                        fontSize: 18,
                      )),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: TextField(
                  controller: gasolinaController,
                  keyboardType: TextInputType.number,
                  style: TextStyle(fontSize: 15),
                  decoration: InputDecoration(
                      labelText: "Valor da Gasolina",
                      prefix: Text("R\$ "),
                      labelStyle: TextStyle(
                        color: Colors.blue[800],
                        fontSize: 18,
                      )),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 30.0),
                height: 50.0,
                width: 200.0,
                child: RaisedButton(
                  child: Text(
                    "Calcular",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.blue,
                  onPressed: () {
                    double valorAlcool = double.parse(
                        alcoolController.text.isEmpty
                            ? '0.0'
                            : alcoolController.text);
                    double valorGasolina = double.parse(
                        gasolinaController.text.isEmpty
                            ? '1.0'
                            : gasolinaController.text);
                    double resultado = valorAlcool / valorGasolina;
                    setState(() {
                      if (resultado < 0.7) {
                        _resultado = "Abasteça com Alcool!";
                      } else {
                        _resultado = "Abasteça com Gasolina!";
                      }
                    });
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 80),
                child: Text(
                  _resultado,
                  style: TextStyle(color: Colors.lightBlue, fontSize: 30),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
