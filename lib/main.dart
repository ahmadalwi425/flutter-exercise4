import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    var listItem = [
      "Kelvin",
      "Reamur"
    ];
    double _inputUser = 0;
    double _kelvin = 0;
    double _reamur = 0;
    TextEditingController _inputController = new TextEditingController();
    String? _newValue = "Kelvin";
    double _result = 0;
    return MaterialApp(
      debugShowCheckedModeBanner: false, //hide debug banner
      home: Scaffold(
        appBar: AppBar(
          title: Text("Konverter Suhu"),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                child:TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Masukkan suhu terlebih  dahulu';
                    }
                    return null;
                  },
                  controller: _inputController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Masukkan Suhu Dalam Celcius",
                  ),
                ),
              ),
              DropdownButton<String>(
                    items: listItem.map((String value){
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                        );
                      }).toList(),
                      value: _newValue,
                      onChanged: (changeValue){
                        setState(() {
                          _newValue = changeValue;
                        });
                      }
                ),
              Container(
                padding: EdgeInsets.only(top:20),
                child: Column(
                  children: [
                    Text("Hasil",style : TextStyle(fontSize:20)),
                    
                    Text(_result.toString(),style : TextStyle(fontSize:30))
                  ],
                ),
              ),
              SizedBox(
                child: Container(
                  width: double.infinity,
                  child: RaisedButton(
                    color: Colors.blueAccent,
                    textColor: Colors.white,
                    child:
                      
                      Text("Konversi Suhu"),
                      onPressed: ((){
                        if(_newValue == 'Kelvin'){
                          _kelvin = double.parse(_inputController.text) - 273;
                          _result = _kelvin;
                        }else if(_newValue == 'Reamur'){
                          _reamur = (4/5) * double.parse(_inputController.text);
                          _result = _reamur;
                        }
                      }),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top:20),
                child: Text("Riwayat Konversi",style : TextStyle(fontSize:20)),
              ),
              Expanded(
                child: ListView(
                  children: [],
                ),
              )
            ],
          ),
        )
      )
    );
  }
}



