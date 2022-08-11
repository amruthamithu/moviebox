import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double? _deviceHeight, _deviceWidth;
  Future<List<dynamic>> fetchUsers() async {
    var result = await http.get(
        Uri.parse("https://api-telly-tell.herokuapp.com/movies/rahul.verma"));
    return jsonDecode(result.body)['data'];
  }

  @override
  void initState() {
    fetchUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: const Color(0xff01A0C7),
        title: const Text(
          "Movie Box",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, 'login'),
                child: const Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              )
            ],
          )
        ],
      ),
      body: myApiWidget(),
    );
  }

  myApiWidget() {
    return FutureBuilder(
      future: fetchUsers(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return GridView.builder(
            // physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 2,
              mainAxisSpacing: 2,
              childAspectRatio: .7,
            ),
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                padding: const EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                      snapshot.data[index]['image'],
                      fit: BoxFit.cover,
                      height: _deviceHeight! * 0.3,
                      width: _deviceHeight! * 0.4,
                    ),
                    Text(
                      snapshot.data[index]['title'] +
                          " (" +
                          snapshot.data[index]['year'] +
                          ") ",
                      style: const TextStyle(
                        color: Color.fromARGB(255, 43, 111, 175),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
