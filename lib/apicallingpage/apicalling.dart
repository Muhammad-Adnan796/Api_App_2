


import 'dart:convert';


import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class ApiCallingPage extends StatefulWidget {
  const ApiCallingPage({Key? key}) : super(key: key);

  @override
  State<ApiCallingPage> createState() => _ApiCallingPageState();
}

class _ApiCallingPageState extends State<ApiCallingPage> {
  List<ApiModel2> apiList = [];

  Future<List<ApiModel2>> getDataApi() async {
    final respnse = await http
        .get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));

    var data = jsonDecode(respnse.body.toString());

    if (respnse.statusCode == 200) {
      for (Map i in data) {
        ApiModel2 apimodel2 = ApiModel2(title: i["title"], url: i["url"],id: i["id"]);
        apiList.add(apimodel2);
      }
      return apiList;
    } else {
      return apiList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 20,
        shadowColor: Colors.blue.shade900,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Api Data 2",
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 28,
              color: Colors.blue.shade900),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getDataApi(),
              builder: (context,AsyncSnapshot<List<ApiModel2>> snapshot) {
                return ListView.builder(
                    itemCount: apiList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: (){},
                        leading: CircleAvatar(
                          backgroundImage:  NetworkImage(snapshot.data![index].url.toString()),
                        ),

                        title: Text("Notes Id :${snapshot.data![index].id.toString()}"),
                        subtitle: Text(snapshot.data![index].title.toString()),
                      );
                    },
                  );

              },
            ),
          ),
        ],
      ),
    );
  }
}



class ApiModel2 {
  String title, url;
  int id;
  ApiModel2({required this.title,required this.url,required this.id});
}
