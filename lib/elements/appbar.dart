import 'package:flutter/material.dart';

class Appbar extends StatelessWidget implements PreferredSizeWidget {
  final BuildContext context;
  const Appbar({super.key ,  required this.context});
   

  @override
   Size get preferredSize => Size.fromHeight(kToolbarHeight);
  
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(MediaQuery.of(context).size.height),
      child: AppBar(
        leading: IconButton(onPressed: null, icon: Icon(Icons.menu , color: Colors.white, size:  Size.fromHeight(kToolbarHeight).height*0.45,)),
        title: const Text("Chess" ,style: TextStyle(color: Colors.white),),
        backgroundColor: Color.fromRGBO(121, 152, 84, 1.0),
        
      ),
    );
  }
}