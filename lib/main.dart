import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  TextEditingController _valeurAController = new TextEditingController();
  TextEditingController _valeurBController = new TextEditingController();
  int resultat = 0;

  @override
  void dispose() {
    _valeurAController.dispose();
    _valeurBController.dispose();
    super.dispose();
  }


  void _showToast(message) {
    Fluttertoast.showToast(
      msg: '$message',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  void _calcul() {
    if(_valeurAController.text.isEmpty || _valeurBController.text.isEmpty){
      _showToast('Veuillez completer tous les champs');
    } else {
      int? valueANumber = int.tryParse(_valeurAController.text);
      int? valueBNumber = int.tryParse(_valeurBController.text);

      if(valueANumber != null || valueBNumber != null){

        int calcValue = valueANumber! + valueBNumber!;
        print('############################################### calc value : $calcValue');
        setState(() {
          resultat = calcValue;
        });
      } else {
        _showToast('Veuillez completer tous les champs !!! ');
      }
    }
  }

  void _cancelCalcul(){
    setState(() {
      _valeurAController.text = '';
      _valeurBController.text = '';
      resultat = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text('Simple calculatrice'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              //  Label title
              Container(
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.orange,
                ),
                width: double.infinity,
                height: 100,
                child: Column(
                  children: <Widget>[
                    Image(
                      image: AssetImage('assets/images/calcul.png'),
                      width: 50,
                      height: 70,
                    ),
                    const Text("Simple calculatrice")
                  ],
                ),

                // child: const Center(
                //     child: Text('Simple Calc',
                //         style: TextStyle(
                //             fontWeight: FontWeight.bold, fontSize: 30)))),
              ),

              //  2 Field value
              Container(
                  margin: const EdgeInsets.all(30),
                  width: double.infinity,
                  height: 50,
                  child: Center(
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: _valeurAController,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(), hintText: 'Valeur a'),
                      ))),
              Container(
                  margin: const EdgeInsets.all(30),
                  width: double.infinity,
                  height: 50,
                  child: Center(
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: _valeurBController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(), hintText: 'Valeur b'),
                      ))),

              //  Button calcul & cancel
              Container(
                margin: const EdgeInsets.all(30),
                width: double.infinity,
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton.icon(
                      onPressed: _calcul,
                      // onPressed: (){
                      //   SnackBar(content: Text("VEUILLEZ COMPLETER LES CHAMPS"));
                      // },
                      icon: const Icon(Icons.plus_one),
                      label: const Text("Calculer"),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.green,
                      ),
                    ),
                    const SizedBox(width: 20),
                    ElevatedButton.icon(
                      onPressed: _cancelCalcul,
                      icon: const Icon(Icons.cancel),
                      label: const Text("Annuler"),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                  margin: const EdgeInsets.all(50),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.amber),
                  width: double.infinity,
                  height: 80,
                  child: Center(
                      child: Text('$resultat',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)))),
            ],
          )
        )
    );
  }
}

//  TP 2 :
/**
 * -  Separer les widgets
 * -  Separer la logique
 * -  Rajouter une splashscreen
 * -  rajouter des bouton signe (+ - * /) pour choisir la calcul a faire
 */
