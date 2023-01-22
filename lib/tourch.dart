import 'package:flutter/material.dart';
import 'package:torch_controller/torch_controller.dart';

class Tourch extends StatefulWidget {
  const Tourch({Key? key}) : super(key: key);

  @override
  State<Tourch> createState() => _TourchState();
}

class _TourchState extends State<Tourch> {
  var color = Color(0xff121212);
  bool isActivated = false;
  String cheers = 'OFF';
  final controller = TorchController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:isActivated ==false? Colors.white:color,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: GestureDetector(
              onTap: (){
                if(isActivated==false){
                  setState(() {
                    cheers = 'OFF';
                    print(cheers);
                  });
                }
                if(isActivated==true){
                  setState(() {
                    cheers = 'ON';
                    print(cheers);
                  });
                }
                setState(() {
                  isActivated = !isActivated;
                  controller.toggle();
                });
              },
              child: CircleAvatar(
                radius: 40,
                child: Icon(
                  Icons.power_settings_new_outlined,
                  size: 40,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
