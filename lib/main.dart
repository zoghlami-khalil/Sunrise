import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sunchine',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: ColorScheme.light()),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TimeOfDay _time = TimeOfDay(hour: 7, minute: 00);
  TimeOfDay _time2 = TimeOfDay(hour: 20, minute: 00);

  void _selectTime() async {
    final TimeOfDay newTime = await showTimePicker(
      context: context,
      initialTime: _time,
    );
    if (newTime != null) {
      setState(() {
        _time = newTime;
      });
      http.Response b= await http.post(Uri.parse('http://192.168.61.128/optime'),body:{'op':_time.format(context)});
      print(b.body);
    }
  }

  void _selectTime2() async {
    final TimeOfDay newTime = await showTimePicker(
      context: context,
      initialTime: _time2,
    );
    if (newTime != null) {
      setState(() {
        _time2 = newTime;
      });
      http.Response f= await http.post(Uri.parse('http://192.168.61.128/cltime'),body:{'cl':_time2.format(context)});
      print(f.body);
    }
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white38,
      appBar: AppBar(
        title: Text('Sunshine demo'),
        centerTitle: true,
        backgroundColor: Colors.orangeAccent,
      ),
      body: new Stack(
        children: <Widget>[
          new Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: AssetImage("lib/img/blindphoto.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          new Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 120),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        ElevatedButton.icon(
                          onPressed: () async{
                            http.Response k= await http.get(Uri.parse('http://192.168.61.128/open'));
                            print(k.body);
                          },
                          icon: Icon(Icons.arrow_upward),
                          label: Text('Open Blinds'),
                        ),
                        ElevatedButton.icon(
                          onPressed: () async{
                            http.Response l= await http.get(Uri.parse('http://192.168.61.128/close'));
                            print(l.body);
                          },
                          icon: Icon(Icons.arrow_downward),
                          label: Text('Close Blinds'),
                        ),
                      ]),
                ),
                SizedBox(height: 20),
                SizedBox(height: 100),
                Text(
                  'Opening time: ${_time.format(context)}',
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: ElevatedButton.icon(
                    onPressed: _selectTime,
                    icon: Icon(Icons.arrow_upward),
                    label: Text('Select time'),
                  ),
                ),
                SizedBox(height: 40),
                Text(
                  'Closing time: ${_time2.format(context)}',
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      _selectTime2();
                    },
                    icon: Icon(Icons.arrow_downward),
                    label: Text('Select time'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
