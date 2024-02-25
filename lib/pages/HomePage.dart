import 'package:chess_prototype/styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

import '../elements/appbar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Map<String, dynamic>> gameData = [];

  @override
  void initState() {
    super.initState();
    loadGameData();
  }

  Future<void> loadGameData() async {
    try {
      // Load JSON data from assets
      String jsonData = await rootBundle.loadString('assets/games.json');

      // Parse JSON string to List<Map<String, dynamic>>
      List<dynamic> gamesJson = jsonDecode(jsonData);

      // Convert each JSON object to a Map and add it to gameData list
      for (dynamic game in gamesJson) {
        gameData.add(Map<String, dynamic>.from(game));
      }

      // Update the UI after loading data
      setState(() {});
    } catch (e) {
      print('Error loading game data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      child: Scaffold(
        appBar: Appbar(context: context),
        body: Body(gameData: gameData),
      ),
    );
  }
}

class Body extends StatelessWidget {
  final List<Map<String, dynamic>> gameData;

  const Body({Key? key, required this.gameData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: const Color.fromRGBO(47, 47, 43, 1.0),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
            height: MediaQuery.of(context).size.height * 0.9,
            width: MediaQuery.of(context).size.width * 0.4,
            child: Image.asset('assets/phprnyp9x.png'), // Assuming phprnyp9x.png exists in assets folder
          ),
          Container(
            color: const Color.fromRGBO(217, 217, 217, 1.0),
            margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
            height: MediaQuery.of(context).size.height * 0.74,
            width: MediaQuery.of(context).size.width * 0.4,
            child: Container(
              margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
              color: Color.fromARGB(7, 255, 255, 253), // Light shade of white
              child: Stack(
                children: [
                  // Background for rounded corners (optional, use if needed)
                  Container(
                    height: MediaQuery.of(context).size.height * 0.6,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(0.0),
                      color: const Color.fromRGBO(240, 240, 240, 1.0),
                      // Another shade of white
                    ),
              
                    // DATA INSIDE DATABASE VIEW HERE
                    child: Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.08),
                      child: 
                      // gameData.isEmpty
                      //     ? const Center(child: CircularProgressIndicator()) // Show a loading indicator while data is being loaded
                      //     : 
                         Column(
                          children: [
                            Container(
                              margin: EdgeInsets.all(MediaQuery.of(context).size.width*0.012),
                              child:  Row(
                              
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(flex:1,child: Text("Date" , style: listview_title,)),
                                Expanded(flex:2,child: Text("White Player" , style: listview_title,)),
                                Expanded(flex:1,child: Text("(ELO)" , style: listview_title,)),
                                Expanded(flex:2,child: Text("Black Player" , style: listview_title,)),
                                Expanded(flex:1,child: Text("(ELO)" , style: listview_title,)),
                                Expanded(flex:1,child: Text("Result" , style: listview_title,)),
                              
                              
                              
                              ],
                                
                              
                              
                              ),
                            ),
                             
                            Container(
                              width: MediaQuery.of(context).size.width * 0.4,
                              height: MediaQuery.of(context).size.height * 0.4,
                              margin: EdgeInsets.only(left:MediaQuery.of(context).size.width*0.002 ),
                              child: 
                              ListView.builder(
                itemCount: gameData.length,
                itemBuilder: (context, index) {
                  // Assuming 'Date' is the key for date in your JSON data
                  String date = gameData[index]['Date'] ?? '';
                  String White = gameData[index]['White'] ?? '';
                  String WhiteElo = gameData[index]['WhiteElo'] ?? '';
                  String Black = gameData[index]['Black'] ?? '';
                  String BlackElo = gameData[index]['BlackElo'] ?? '';
                  String Result = gameData[index]['Result'] ?? '';
              
                  return ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(flex: 1, child: Text(date, style: TextStyle(color: Colors.black, fontSize: 9, fontWeight: FontWeight.w800),)),
                        Expanded(flex: 2, child: Text(White, style: listview)),
                        Expanded(flex: 1, child: Text('( $WhiteElo )', style: listview)),
                        Expanded(flex: 2, child: Text(Black, style: listview)),
                        Expanded(flex: 1, child: Text('( $BlackElo )', style: listview)),
                        Expanded(flex: 1, child: Text(Result, style: listview)),
                      ],
                    ),
                    // Add onTap callback if needed
                  );
                },
              ),
              
              
                              //   itemBuilder: (context, index) {
                                  
                              //     // Assuming 'Date' is the key for date in your JSON data
                              //     String date = gameData[index]['Date'] ?? '';
                              //     String White = gameData[index]['White'] ?? '';
                              //     String WhiteElo = gameData[index]['WhiteElo'] ?? '';
                              //     String Black = gameData[index]['Black'] ?? '';
                              //     String BlackElo = gameData[index]['BlackElo'] ?? '';
                              //     String Result = gameData[index]['Result'] ?? '';
              
                              //     return ListTile( 
                              //       title: Text(date +"\t\t" +Black  ),
                                  
                              //       // Add onTap callback if needed
                              //     );
                              //   },
                                 // ),
                            ),
                           
                          ],
                         ),
                    ),
                  ),
              
                  // Text field with curved edges (optional, adjust border if needed)
                  Column(
                    children: [
                      Container(
                        
                        margin: EdgeInsets.all(
                            MediaQuery.of(context).size.width * 0.005),
                        width: MediaQuery.of(context).size.width * 0.55,
                        height: MediaQuery.of(context).size.height * 0.06,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40.0),
                          color: Color.fromRGBO(236, 230, 240, 1.0),
                          // Another shade of white
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                              horizontal:
                                  50.0, // Add padding for cursor visibility
                              vertical: 8.0,
                            ),
                            hintText: 'Search...',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40.0),
                              borderSide: BorderSide(
                                  width: 0,
                                  color: Colors
                                      .black26 // Transparent border for curved edges
                                  ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),  
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 0,
                              ),
                            ),
                            // Fill with pink color (semi-transparent)
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Menu bar icon
                  Positioned(
                    left: MediaQuery.of(context).size.width * 0.01,
                    top: MediaQuery.of(context).size.height * 0.0085,
                    child: IconButton(
                      icon: Icon(Icons.menu, color: Colors.grey),
                      onPressed: () {
                        // Handle menu button press
                      },
                    ),
                  ),
                  // Search button icon
                  Positioned(
                    right: MediaQuery.of(context).size.width * 0.01,
                    top: MediaQuery.of(context).size.height * 0.0085,
                    child: IconButton(
                      icon: Icon(Icons.search, color: Colors.blueAccent),
                      onPressed: () {
                        // Handle search button press
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.6,
                      
                    ),
                    child: Row(children: [
                       IconButton(onPressed: null, icon: Icon(Icons.zoom_in_rounded, color: Colors.black54 , size:Size.fromHeight(kToolbarHeight).height*0.6, ) , tooltip: "Maximize",),
                    IconButton(onPressed: null, icon: Icon(Icons.add, color: Colors.black54 , size:Size.fromHeight(kToolbarHeight).height*0.6), tooltip: "Add",),
                    ]),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}





















// import 'package:chess_prototype/elements/appbar.dart';
// import 'package:flutter/material.dart';

// class MyHomePage extends StatelessWidget {
//   const MyHomePage({super.key});

//   @override
  
//   Widget build(BuildContext context) {
//     return ScaffoldMessenger(
//       child: Scaffold(
//           appBar: Appbar(context: context,),
//           body:  Body(context: context,),
//       ),

  
//     );
//   }
// }

// class Body extends StatelessWidget {
//    final BuildContext context;
 
//    Body({super.key , required this.context});

//   @override
  
//   Widget build(BuildContext context) {
//     return Container(
//       height: MediaQuery.of(context).size.height,
//       width: MediaQuery.of(context).size.width,
//       color:const Color.fromRGBO(47,47,43, 1.0),
//       child: Row(
        
//         children: [
//         Container(
//           margin: EdgeInsets.all(MediaQuery.of(context).size.width*0.05),
//           height: MediaQuery.of(context).size.height*0.9,
//       width: MediaQuery.of(context).size.width*0.4,

//           child: Image(image: AssetImage('phprnyp9x.png')),


          
//         ),
//         Container(
          
          
//           color: Color.fromRGBO(217,217,217, 1.0),
//            margin: EdgeInsets.all(MediaQuery.of(context).size.width*0.05),
//           height: MediaQuery.of(context).size.height*0.74,
//       width: MediaQuery.of(context).size.width*0.4,
//       child: Container(
//         margin: EdgeInsets.all(MediaQuery.of(context).size.width*0.02),
        
//         color: Color.fromRGBO(255,255,253, 1),
//         child: Container(
//           margin: EdgeInsets.all(MediaQuery.of(context).size.width*0.01),
//           color: Colors.blueAccent,
//           child: Column(
            
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
             
              
//             ]
//           ),
//         ),
       
//       ),

//         ),


//       ]),
    
    
//     );
//   }
// }