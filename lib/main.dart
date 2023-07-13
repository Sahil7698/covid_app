import 'package:flutter/material.dart';

import 'models/helpers/api_helper.dart';

void main() {
  runApp(const MyCovidApp());
}

class MyCovidApp extends StatefulWidget {
  const MyCovidApp({Key? key}) : super(key: key);

  @override
  State<MyCovidApp> createState() => _MyCovidAppState();
}

class _MyCovidAppState extends State<MyCovidApp> {
  String Country_name = 'UK';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: const Text(
              "Covid-19 APP",
              style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            backgroundColor: Colors.orange.shade100,
          ),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  height: 30,
                  width: 330,
                  child: const Text(
                    "Country Name",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.orange),
                  ),
                ),
                TextFormField(
                  cursorColor: Colors.orange,
                  onChanged: (val) {
                    setState(() {
                      Country_name = val;
                    });
                  },
                  decoration: InputDecoration(
                      focusedBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.orange, width: 2)),
                      border: const OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(35),
                          borderSide: BorderSide(
                              color: Colors.orange.shade100, width: 2)),
                      label: const Text("Enter Country/State/City"),
                      labelStyle: const TextStyle(color: Colors.grey)),
                ),
                const SizedBox(
                  height: 50,
                ),
                Expanded(
                  child: FutureBuilder(
                    future:
                        Apihelper.apihelper.Getcountry(country: Country_name),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Text('${snapshot.error}');
                      } else if (snapshot.hasData) {
                        Map? p = snapshot.data;
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              alignment: Alignment.centerLeft,
                              height: 50,
                              width: 330,
                              decoration: BoxDecoration(
                                boxShadow: const [
                                  BoxShadow(
                                      spreadRadius: 1,
                                      blurRadius: 5,
                                      color: Colors.orange),
                                ],
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.orange.shade100,
                              ),
                              child: Text.rich(
                                TextSpan(
                                  children: [
                                    const TextSpan(
                                        text: "Country                 :",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,),),
                                    TextSpan(
                                      text: "  ${p!['data']['location']}",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.orange.shade900,),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(10),
                              margin: const EdgeInsets.only(top: 20),
                              alignment: Alignment.centerLeft,
                              height: 50,
                              width: 330,
                              decoration: BoxDecoration(
                                boxShadow: const [
                                  BoxShadow(
                                      spreadRadius: 1,
                                      blurRadius: 5,
                                      color: Colors.orange),
                                ],
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.orange.shade100,
                              ),
                              child: Text.rich(
                                TextSpan(
                                  children: [
                                    const TextSpan(
                                        text: "Total Deaths         :",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black)),
                                    TextSpan(
                                      text: "   ${p['data']['deaths']}",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.orange.shade900),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(10),
                              margin: const EdgeInsets.only(top: 20),
                              alignment: Alignment.centerLeft,
                              height: 50,
                              width: 330,
                              decoration: BoxDecoration(
                                boxShadow: const [
                                  BoxShadow(
                                      spreadRadius: 1,
                                      blurRadius: 5,
                                      color: Colors.orange),
                                ],
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.orange.shade100,
                              ),
                              child: Text.rich(
                                TextSpan(
                                  children: [
                                    const TextSpan(
                                        text: "Confirmed Case   :",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black)),
                                    TextSpan(
                                      text: "   ${p['data']['confirmed']}",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.orange.shade900),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      }

                      return const Center(
                          child: CircularProgressIndicator(
                        color: Colors.orange,
                      ),);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
