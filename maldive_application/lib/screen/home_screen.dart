import 'dart:convert';

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'package:maldive_application/config/app.dart';
import 'package:maldive_application/service/auth_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> banners = [];

  Future<void> fetchBanners() async {
    try {
      final response = await http.get(Uri.parse('$API_URL/api/banners'));
      final banners = jsonDecode(response.body);
      print(banners);
      setState(() {
        this.banners = banners;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    AuthService().checkLogin().then((loggedin) {
      if (!loggedin) {
        Navigator.pushReplacementNamed(context, "/login");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text("Menu"),
            ),
            ListTile(
              onTap: () {},
              title: Text("News"),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("Home "),
      ),
      body: Container(
          child: Swiper(
              autoplay: true,
              itemCount: banners.length,
              itemBuilder: (context, Index) {
                return Image.network(
                  "$API_URL${banners[Index]['imageUrl']}",
                );
              })),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: "Calculate",
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Home",
            backgroundColor: Colors.blue,
          ),
        ],
      ),
    );
  }
}

