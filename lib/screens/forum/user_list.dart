import 'package:flutter/material.dart';

import '../../main.dart';

class UserList extends StatefulWidget {
  final String boxType;
  const UserList({Key? key,required this.boxType}) : super(key: key);

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User'),
      ),
      body: StreamBuilder(
        key: UniqueKey(),
        stream: objectBox.getUsers(),
        builder: (context,snapshot){
          if(snapshot.data?.isNotEmpty ?? false ){
            return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.hasData ? snapshot.data!.length : 0,
                itemBuilder: (BuildContext context,int index){
                  return  Card(
                      child: Column(
                        children: <Widget>[
                          Text(snapshot.data![index].name),
                          Text('id ${snapshot.data![index].id.toString()}'),
                        ],
                      )
                  );
                }
            );
          }else{
            return const Center(child: Text('Add new Post'),);
          }
        },
      ),
    );
  }
}