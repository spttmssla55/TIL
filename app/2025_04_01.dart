import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// final items = List.generate(100, (i) => i).toList();
class MyApp extends StatelessWidget {
   const MyApp({super.key});





  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: '제목2'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {


              // Tab바 만들기 위한 설정
    // return DefaultTabController(
    //   length: 3,
    //   child:Scaffold(
    //     appBar: AppBar(
    //       title:Text('Tab'),
    //       bottom: TabBar(
    //         tabs: <Widget>[
    //           Tab(icon: Icon(Icons.tag_faces)),
    //           Tab(text: '메뉴2'),
    //           Tab(icon: Icon(Icons.info), text: '메뉴3'),
    //         ],
    //       ),
    //     ),
    //     body: TabBarView(
    //       children: <Widget>[
    //         Container(color: Colors.yellow,),
    //         Container(color: Colors.orange,),
    //       Container(color: Colors.red,),
    //       ]),
    // ),





                        // 아래 위젯
    // return Scaffold(
    //   bottomNavigationBar: BottomNavigationBar(items: [
    //     BottomNavigationBarItem(
    //       icon: Icon(Icons.home),
    //       label: 'Home',
    //     ),
    //     BottomNavigationBarItem(
    //         icon: Icon(Icons.person),
    //         label: 'Profile',
    //     ),
    //     BottomNavigationBarItem(
    //       icon: Icon(Icons.notifications),
    //       label: 'Natification',
    //     ),
    //   ]),



     return Scaffold(

      appBar: AppBar(
        title: Text(title),
      ),

    body:





                              // 사용자 아이콘
         // CircleAvatar(
         //   child: Icon(Icons.person),
         // )



                              // 아이콘
         // Icon(
         //   Icons.home,
         //   color: Colors.red,
         //   size: 60.0,
         // )




                              // 이미지 넣는 법
         // Image.network('http://bit.ly/2Pvz4t8')



                              // 글자 꾸미기
        //
        // Center(
        //     child: Text(
        //      'Hello World',
        //      style: TextStyle(
        //        fontSize: 40.0,
        //        fontStyle: FontStyle.italic,
        //        fontWeight: FontWeight.bold,
        //        color: Colors.red,
        //        letterSpacing: 4.0,
        //    ),
        //  )
        // )
        //



                                // 각 종 버튼들
         //
         // Center(
         //   child: Column(
         //     children: [
         //       ElevatedButton(
         //           onPressed: () {},
         //           child:Text('RaisedButtom'),
         //       ),
         //       TextButton(
         //         onPressed: () {},
         //         child:Text('TextButtom'),
         //       ),
         //       IconButton(
         //         icon: Icon(Icons.add),
         //         color: Colors.red,
         //         iconSize: 100.0,
         //         onPressed: () {},
         //       ),
         //       FloatingActionButton(
         //         child: Icon(Icons.add),
         //         onPressed: () {},
         //       )
         //     ],
         //   ),
         // )







                             // 버튼
         // ElevatedButton(
         //   onPressed: () {},
         //   child: Text('RaisedButton'),
         // ),



                          // 카드
        // Center(
        //   child: Card(
        //     shape: RoundedRectangleBorder(
        //       borderRadius: BorderRadius.circular(16.0),  // 곡선 ( 둥근 사각형 )
        //     ),
        //     elevation: 4.0,                               // 그림자
        //     child: Container(
        //       width: 400,
        //       height: 200,
        //     ),
        //
        //   ),
        // )



                          // 특정 사이즈로 고정
        // SizedBox(
        //   width: 100,
        //   height: 100,
        //   child: Container(
        //     color: Colors.red,
        //     child: Text('내용'),
        //   ),
        // )



                          // 화면 비율에 맞게 색상 크기
         // Column(
         //  children: [
         //    Expanded(
         //      flex: 2,
         //      child: Container(
         //        color: Colors.red,
         //      ),
         //    ),
         //    Expanded(
         //      child: Container(
         //        color: Colors.green,
         //      ),
         //    ),
         //    Expanded(
         //      child: Container(
         //        color: Colors.blue,
         //      ),
         //    ),
         //
         //  ],
         // )



                        // 오른쪽 정렬
         // Align(
         //   alignment: Alignment.centerRight,
         //   child: Container(
         //     color: Colors.red,
         //     width: 100,
         //     height: 100,
         //   ),
         // ),

                          // 겹치기 중앙 정렬
         // Container(
         //   color: Colors.green,
         //   width: 100,
         //   height: 100,
         //   padding: const EdgeInsets.all(20.0),
         //   child: Container(
         //     color: Colors.red,
         //   ),
         // ),

         
         
                          // 글자 가운데 정렬
        // Container(
        //   color: Colors.red,
        //   width: 100,
        //   height: 100,
        //   child: Center(
        //     child: Text('123'),
        //   ),
        //
        // ),

         
                        // 가운데 정렬
         // Center(
         //   child: Container(
         //     color: Colors.red,
         //     width: 100,
         //     height: 100,
         //   )
         // )





                            // 슬라이드
        // PageView(
        //   children: <Widget>[
        //     Container(
        //       color: Colors.red,
        //     ),
        //     Container(
        //       color: Colors.green,
        //     ),
        //     Container(
        //       color: Colors.blue,
        //     ),
        //   ],
        // )





                              // 가로 2줄 로 나옴
    //     GridView.count(
    //       crossAxisCount: 2,
    //       children: <Widget>[
    //         Container(
    //             color: Colors.red,
    //             width:100,
    //             height: 100,
    //             padding: const EdgeInsets.all(8.0),
    //             margin: const EdgeInsets.all(8.0)
    //         ),
    //         Container(
    //             color: Colors.green,
    //             width:100,
    //             height: 100,
    //             padding: const EdgeInsets.all(8.0),
    //             margin: const EdgeInsets.all(8.0)
    //         ),
    //         Container(
    //             color: Colors.blue,
    //             width:100,
    //             height: 100,
    //             padding: const EdgeInsets.all(8.0),
    //             margin: const EdgeInsets.all(8.0)
    //         ),
    //
    //     ]
    //
    // )







                          // 위젯
        // ListView(
        //   scrollDirection:Axis.vertical,
        //   children: <Widget>[
        //     ListTile(
        //       leading: Icon(Icons.home),
        //       title:Text('Home'),
        //       trailing:Icon(Icons.navigate_next),
        //       onTap: () {},
        //     ),
        //     ListTile(
        //       leading: Icon(Icons.event),
        //       title:Text('Event'),
        //       trailing:Icon(Icons.navigate_next),
        //       onTap: () {},
        //     ),
        //     ListTile(
        //       leading: Icon(Icons.camera),
        //       title:Text('Camera'),
        //       trailing:Icon(Icons.navigate_next),
        //       onTap: () {},
        //     )
        //   ]
        // )




      // SingleChildScrollView(
      //   child: ListBody(
      //     children: items.map((i) => Text('$i')).toList(),
      //     ),
      //   ),




                      // 겹치기
        // Stack(
        //   children: <Widget>[
        //     Container(
        //     color: Colors.red,
        //     width: 100,
        //     height: 100,
        //     padding: const EdgeInsets.all(8.0),
        //     margin: const EdgeInsets.all(8.0)
        // ),
        // Container(
        //     color: Colors.green,
        //     width: 80,
        //     height: 80,
        //     padding: const EdgeInsets.all(8.0),
        //     margin: const EdgeInsets.all(8.0)
        // ),
        // Container(
        //     color: Colors.blue,
        //     width: 50,
        //     height: 50,
        //     padding: const EdgeInsets.all(8.0),
        //     margin: const EdgeInsets.all(8.0)
        // )
        //
        //   ],
        // )





                    // 가로 정렬
        // Row(
        //     children: <Widget>[
        //         Container(
        //           color: Colors.red,
        //           width: 100,
        //           height: 100,
        //           padding: const EdgeInsets.all(8.0),
        //           margin: const EdgeInsets.all(8.0),
        //           child: Text("난 자식1")
        //         ),
        //       Container(
        //           color: Colors.green,
        //           width: 100,
        //           height: 100,
        //           padding: const EdgeInsets.all(8.0),
        //           margin: const EdgeInsets.all(8.0),
        //           child: Text("난 자식2")
        //       ),
        //       Container(
        //           color: Colors.blue,
        //           width: 100,
        //           height: 100,
        //           padding: const EdgeInsets.all(8.0),
        //           margin: const EdgeInsets.all(8.0),
        //           child: Text("난 자식3")
        //       )
        //   ],
        // )





                    // 세로 정렬
      // Column(
      //     children: <Widget>[
      //       Container(
      //         color: Colors.red,
      //         width: 100,
      //         height: 100,
      //         padding: const EdgeInsets.all(8.0),
      //         margin: const EdgeInsets.all(8.0),
      //         child: Text("난 자식1")
      //       ),
      //       Container(
      //         color: Colors.green,
      //         width: 100,
      //         height: 100,
      //         padding: const EdgeInsets.all(8.0),
      //         margin: const EdgeInsets.all(8.0),
      //         child: Text("난 자식2")
      //       ),
      //       Container(
      //           color: Colors.blue,
      //           width: 100,
      //           height: 100,
      //           padding: const EdgeInsets.all(8.0),
      //           margin: const EdgeInsets.all(8.0),
      //           child: Text("난 자식3")
      //       )
      //     ]
      //
      // )



                      // 사각형 생성
      // Container(
      //   color: Colors.red,
      //   width: 100,
      //   height: 100,
      //   padding: const EdgeInsets.all(8.0),
      //   margin: const EdgeInsets.all(8.0),
      //   child: Text("난 자식")
      // )
      //
    // )


                      // 글자 생성
        // Text('여기에 예제 작성2'),

     );
  }
}
