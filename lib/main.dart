import 'dart:math';

import 'package:flutter/material.dart'; 

void main() => runApp(MyApp()); 

class MyApp extends StatefulWidget { 
   @override 
   _MyAppState createState() => _MyAppState(); 
  } 

  class _MyAppState extends State<MyApp> {   
    final TextEditingController _acontroller = TextEditingController();
    final TextEditingController _bcontroller = TextEditingController(); 
    double a = 0.0, b = 0.0, result = 0.0;   
    String bmi; 

  int selectedRadio,selectedRadio2;
  String boer,james,hume,peters,brBF,jBF,hBF,pBF;

  @override
  void initState(){
    super.initState();
    selectedRadio = 0;
  }

  setSelectedRadio(int value){
    setState(() {
      selectedRadio = value;
    });
  }
  setSelectedRadio2(int value){
    setState(() {
      selectedRadio2 = value;
    });
  }
  @override   
  Widget build(BuildContext context) { 
     return MaterialApp(      
        title: 'Material App',
        home: Scaffold(
          appBar: AppBar(
          title: new Center(
                child:Text('Lean Body Mass Calculator',style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black),
                        textAlign: TextAlign.center,
          ))),   
          body: SingleChildScrollView(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[ 
              ButtonBar(
                alignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Text('Gender:',style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center),
                  ),
                  Radio(
                    value: 1, 
                    groupValue: selectedRadio, 
                    activeColor: Colors.purple,
                    onChanged: (val){
                      print("Radio $val");
                      setSelectedRadio(val);
                      },
                  ),
                  Container(
                    child:Text('Male',style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center),
                  ),
                Radio(
                    value: 2, 
                    groupValue: selectedRadio, 
                    activeColor: Colors.purple,
                    onChanged: (val){
                      print("Radio $val");
                      setSelectedRadio(val);
                    },
                ),
                      Container(
                    child:Text('Female',style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center),
                  ),
                ],
              ),

            ButtonBar(
                alignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Text('Age 14 or younger?',style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center),
                  ),
                  Radio(
                    value: 1, 
                    groupValue: selectedRadio2, 
                    activeColor: Colors.purple,
                    onChanged: (val){
                      print("Radio $val");
                      setSelectedRadio2(val);
                      },
                  ),
                  Container(
                    child:Text('Yes',style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center),
                  ),
                  Radio(
                    value: 2, 
                    groupValue: selectedRadio2, 
                    activeColor: Colors.purple,
                    onChanged: (val){
                      print("Radio $val");
                      setSelectedRadio2(val);
                    },
                ),
                      Container(
                    child:Text('No',style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center),
                  ),
                ],
              ),
              
              Padding(
                padding: EdgeInsets.fromLTRB(50, 0, 50, 0), 
                child: TextField( 
                  decoration: InputDecoration( 
                     hintText: "Height(cm)", 
                  ), 
                  keyboardType: TextInputType.numberWithOptions(), 
                  controller: _acontroller, 
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(50, 0, 50, 0), 
                child: TextField( 
                  decoration: InputDecoration( 
                     hintText: "Weight(kg)", 
                  ), 
                  keyboardType: TextInputType.numberWithOptions(), 
                  controller: _bcontroller, 
                   ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center,children:<Widget>[
              Padding(
                padding: EdgeInsets.all(5),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                  child: Text("Calculate",style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center),
                        color: Colors.deepPurpleAccent,
                        textColor: Colors.white,
                        splashColor: Colors.deepOrangeAccent,
                  onPressed: _onPress,
                ), 
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                  child: Text("Clear",style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center),
                        color: Colors.deepPurpleAccent,
                        textColor: Colors.white,
                        splashColor: Colors.deepOrangeAccent,
                  onPressed: _onPress1,
                ), 
              ),
              ]
              ),
              Container(child: 
              Text("Results:",
              style:TextStyle(fontSize:20),

              ),
              alignment: Alignment.centerLeft,
            ),
            Container(child: 
              Text('The Lean Body Mass based on different formulas:',),
              alignment: Alignment.centerLeft,
            ),
              Container(
                child: Table(
                border: TableBorder.all(color: Colors.blueGrey),
                children: [
                  TableRow(children: [
                    Text('Formula',
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center),
                    Text('Lean BodyMass (kg)',
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center),
                    Text('Body Fat (%)',
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center),
                  ]),
                  TableRow(children: [
                    Text('Boer',style: TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.center),
                    Text('$boer',style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center),
                    Text('$brBF',style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center),
                  ]),
                  TableRow(children: [
                    Text('James',style: TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.center),
                    Text('$james',style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center),
                    Text('$jBF',style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center),
                  ]),
                  TableRow(children: [
                    Text('Hume',style: TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.center),
                    Text('$hume',style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center),
                    Text('$hBF',style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center),
                  ]),
                    TableRow(decoration:BoxDecoration(color:Colors.grey),
                    children:[
                    Text(''),
                    Text(''),
                    Text(''),
                  ]),
                  TableRow(children: [
                    Text('Peters (For Childeren)',style: TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.center),
                    Text('$peters',style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center),
                    Text('$pBF',style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center),]
                  ),
                ]),
            )
              ],
        ),
      ),
    )
  );
}

  void _onPress() {
    setState((){
     a = double.parse(_acontroller.text);
     b = double.parse(_bcontroller.text);

    if (selectedRadio == 1 && selectedRadio2 == 1) {
      double boer_1 = (0.407 * b) + (0.267 * a) - 19.2;
      double james_1 = (1.1 * b) - (128 * (pow(b / a, 2)));
      double hume_1 = (0.32810 * b) + (0.33929 * a) - 29.5336;
      double peter_1 =
          3.8 * (0.0215 * (pow(b, 0.6469)) * (pow(a, 0.7236)));

      double b1Bodyfat = 100 - (boer_1 / b) * 100;
      double j1Bodyfat = 100 - (james_1 / b) * 100;
      double h1Bodyfat = 100 - (hume_1 / b) * 100;
      double p1Bodyfat = 100 - (peter_1 / b) * 100;

      boer = boer_1.toStringAsFixed(1);
      james = james_1.toStringAsFixed(1);
      hume = hume_1.toStringAsFixed(1);
      peters = peter_1.toStringAsFixed(1);

      brBF = b1Bodyfat.toStringAsFixed(1);
      jBF = j1Bodyfat.toStringAsFixed(1);
      hBF = h1Bodyfat.toStringAsFixed(1);
      pBF = p1Bodyfat.toStringAsFixed(1);

    } else if (selectedRadio == 1 && selectedRadio2 == 2) {
      double boer_1 = (0.407 * b) + (0.267 * a) - 19.2;
      double james_1 = (1.1 * b) - (128 * (pow(b / a, 2)));
      double hume_1 = (0.32810 * b) + (0.33929 * a) - 29.5336;

      double b1Bodyfat = 100 - (boer_1 / b) * 100;
      double j1Bodyfat = 100 - (james_1 / b) * 100;
      double h1Bodyfat = 100 - (hume_1 / b) * 100;

      boer = boer_1.toStringAsFixed(1);
      james = james_1.toStringAsFixed(1);
      hume = hume_1.toStringAsFixed(1);
      peters="None";

      brBF = b1Bodyfat.toStringAsFixed(1);
      jBF = j1Bodyfat.toStringAsFixed(1);
      hBF = h1Bodyfat.toStringAsFixed(1);
      pBF= "None";

    } else if (selectedRadio == 2 && selectedRadio2 == 1) {
      double boer_1 = (0.252 * b) + (0.473 * a) - 48.3;
      double james_1 = (1.07 * b) - (148 * (pow(b / a, 2)));
      double hume_1 = (0.29569 * b) + (0.41813 * a) - 43.2933;
      double peter_1 =
          3.8 * (0.0215 * (pow(b, 0.6469)) * (pow(a, 0.7236)));

      double b1Bodyfat = 100 - (boer_1 / b) * 100;
      double j1Bodyfat = 100 - (james_1 / b) * 100;
      double h1Bodyfat = 100 - (hume_1 / b) * 100;
      double p1Bodyfat = 100 - (peter_1 / b) * 100;

      boer = boer_1.toStringAsFixed(1);
      james = james_1.toStringAsFixed(1);
      hume = hume_1.toStringAsFixed(1);
      peters = peter_1.toStringAsFixed(1);

      brBF = b1Bodyfat.toStringAsFixed(1);
      jBF = j1Bodyfat.toStringAsFixed(1);
      hBF = h1Bodyfat.toStringAsFixed(1);
      pBF = p1Bodyfat.toStringAsFixed(1);

    } else if (selectedRadio2 == 2 && selectedRadio2 == 2) {
      double boer_1 = (0.252 * b) + (0.473 * a) - 48.3;
      double james_1 = (1.07 * b) - (148 * (pow(b / a, 2)));
      double hume_1 = (0.29569 * b) + (0.41813 * a) - 43.2933;

      double b1Bodyfat = 100 - (boer_1 / a) * 100;
      double j1Bodyfat = 100 - (james_1 / a) * 100;
      double h1Bodyfat = 100 - (hume_1 / a) * 100;

      boer = boer_1.toStringAsFixed(1);
      james = james_1.toStringAsFixed(1);
      hume = hume_1.toStringAsFixed(1);
      peters="None";

      brBF = b1Bodyfat.toStringAsFixed(1);
      jBF = j1Bodyfat.toStringAsFixed(1);
      hBF = h1Bodyfat.toStringAsFixed(1);
      pBF= "None";
    }
    });
  }
  void _onPress1() {
             TextField();
             TextField();
             _bcontroller.clear();
             _acontroller.clear();
             ButtonBar();
             setState((){
               selectedRadio=null;
               selectedRadio2=null;
               boer="-";
               james="-";
               hume="-";
               peters="-";
               brBF="-";
               jBF="-";
               hBF="-";
               pBF="-";
             } );
          }
  String format(double n){
    return n.toStringAsFixed(n.truncateToDouble() == n ? 0 : 2);
  }
}
