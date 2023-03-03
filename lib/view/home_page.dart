import 'dart:ffi';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'addPhoto.dart';
import 'imagesPage.dart';

int currentTab = 0;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddPhoto()));
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        elevation: 10,
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: SizedBox(
          height: 65,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MaterialButton(
                  onPressed: () {
                    setState(() {
                      currentTab = 0;
                    });
                  },
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  minWidth: 40,
                  child: Icon(
                    Icons.home,
                    color: currentTab==1?Colors.grey: Colors.blue,
                  ),
                ),
              SizedBox(
                width: 60,
              ),
              MaterialButton(
                  onPressed: () {
                    setState(() {
                      currentTab = 1;
                    },
                  );
                  },
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  minWidth: 40,
                  child: Icon(
                    Icons.image,
                    color: currentTab==0?Colors.grey: Colors.blue,
                  ),
                ),
            ],
          ),
        ),
      ),
      //  CurvedNavigationBar(
      //   backgroundColor: Colors.teal
      //   ,
      //   items: [
      //     Icon(
      //       Icons.image,
      //       size: 25,
      //     ),
      //     Icon(
      //       Icons.add,
      //       size: 25,
      //     ),
      //     Icon(
      //       Icons.download_for_offline_outlined,
      //       size: 25,
      //     ),
      //   ],
      // ),
      body: PageView(
        children: [
          ImagesPage(),
          AddPhoto(),
          Container(
            color: Colors.teal,
            child: Center(
              child: Text(
                '1',
                style: TextStyle(fontSize: 25),
              ),
            ),
          )
        ],
      ),
    );
  }
}
/* 
*/
