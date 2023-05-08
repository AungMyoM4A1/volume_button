import 'package:flutter/material.dart';

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
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: VolumeUp(),
    );
  }
}
class VolumeUp extends StatefulWidget {
  const VolumeUp({super.key});

  @override
  State<VolumeUp> createState() => _VolumeUpState();
}

class _VolumeUpState extends State<VolumeUp> {
  double volume = 0.0;
  void volumeUp(){
    setState(() {
      volume += 10;
      if(volume > 100){
        volume = 100;
      }
    });
  }
  void volumeDown(){
    setState(() {
      volume -= 10;
      if(volume < 0){
        volume = 0;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: Text('$volume', style: const TextStyle(fontSize: 30),),
            ),
            IconButton(
              iconSize: 50,
              onPressed: (){
                volumeUp();
            }, 
            icon: const Icon(Icons.volume_up)),
            IconButton(
              iconSize: 50,
              onPressed: (){
                setState(() {
                  volumeDown();
                });
            }, icon: const Icon(Icons.volume_down))
            
          ],
        ),
      ),
    );
  }
}