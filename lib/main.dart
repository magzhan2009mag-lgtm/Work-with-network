import 'package:flutter/material.dart';
import 'package:autogen_serialization/user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Networking', home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<UsersList>? usersList;

  @override
  void initState() {
    super.initState();
    usersList = getUsersList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Networking'), centerTitle: true),
      body: FutureBuilder<UsersList>(
        future: usersList,
        builder: (BuildContext context, AsyncSnapshot<UsersList> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.users!.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text('${snapshot.data!.users![index].firstName}'),
                    subtitle: Text('${snapshot.data!.users![index].lastName}'),
                    leading: Image.network(
                      '${snapshot.data!.users![index].avatar}',
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return const Text('Error');
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  // Future<http.Response> getData() async {
  //   const url = 'https://api.github.com/users/hadley/orgs';
  //   return await http.get(Uri.parse(url));
  // }

  // void loadData() {
  //   getData()
  //       .then((response) {
  //         if (response.statusCode == 200) {
  //           print(response.body);
  //         } else {
  //           print(response.statusCode);
  //         }
  //       })
  //       .catchError((error) {
  //         print(error.toString());
  //       });
  // }
}
