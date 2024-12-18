import 'dart:developer';

import 'package:first_app/data.dart';
import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<bool> favorites = List.generate(mails.length, (item) => false);
  @override
  Widget build(BuildContext context) {
    final Map<String, IconData> letterToIcon = {
      'A': Mdi.alphaACircle,
      'B': Mdi.alphaBCircle,
      'C': Mdi.alphaCCircle,
      'D': Mdi.alphaDCircle,
      'E': Mdi.alphaECircle,
      'F': Mdi.alphaFCircle,
      'G': Mdi.alphaGCircle,
      'H': Mdi.alphaHCircle,
      'I': Mdi.alphaICircle,
      'J': Mdi.alphaJCircle,
      'K': Mdi.alphaKCircle,
      'L': Mdi.alphaLCircle,
      'M': Mdi.alphaMCircle,
      'N': Mdi.alphaNCircle,
      'O': Mdi.alphaOCircle,
      'P': Mdi.alphaPCircle,
      'Q': Mdi.alphaQCircle,
      'R': Mdi.alphaRCircle,
      'S': Mdi.alphaSCircle,
      'T': Mdi.alphaTCircle,
      'U': Mdi.alphaUCircle,
      'V': Mdi.alphaVCircle,
      'W': Mdi.alphaWCircle,
      'X': Mdi.alphaXCircle,
      'Y': Mdi.alphaYCircle,
      'Z': Mdi.alphaZCircle,
    };
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.pink),
            child: const Padding(
              padding: EdgeInsets.only(top: 50, left: 20),
              child: Text(
                "PRIMARY",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
              child: ListView.builder(
            itemBuilder: (context, index) {
              dynamic data = mails[index];
              String sender = mails[index]["sender"]!;
              String char = sender[0].toUpperCase();
              IconData? icon = letterToIcon[char];
              return ListTile(
                title: Text(
                  data["sender"],
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 22),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data["subject"],
                      style: const TextStyle(fontSize: 20),
                    ),
                    Text(
                      data["message"],
                      style: TextStyle(
                          fontSize: 16,
                          color: favorites[index] ? Colors.pink : Colors.black),
                    ),
                  ],
                ),
                isThreeLine: false,
                tileColor: favorites[index] ? Colors.pink[50] : Colors.white,
                leading: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.pink[400],
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    Icon(
                      icon,
                      size: 60,
                      color: Colors.pink[100],
                    )
                  ],
                ),
                trailing: Column(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Expanded(
                            child: Text(
                              data["date"],
                              style: const TextStyle(fontSize: 14),
                            ),
                          ),
                          Expanded(
                            child: IconButton(
                              icon: favorites[index]
                                  ? Icon(
                                      Icons.star,
                                      color: Colors.amber[300],
                                    )
                                  : const Icon(
                                      Icons.star_border,
                                    ),
                              onPressed: () {
                                setState(() {
                                  favorites[index] = !favorites[index];
                                  log(index.toString());
                                  log(favorites.toString());
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
            itemCount: mails.length,
          ))
        ],
      ),
    );
  }
}
