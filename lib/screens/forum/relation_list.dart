import 'package:flutter/material.dart';

import '../../main.dart';

class RelationList extends StatefulWidget {
  final String boxType;
  const RelationList({Key? key,required this.boxType}) : super(key: key);

  @override
  State<RelationList> createState() => _RelationListState();
}

class _RelationListState extends State<RelationList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Relationship'),
      ),
      body: StreamBuilder(
        key: UniqueKey(),
        stream: widget.boxType == 'objectbox1' ? objectBox.getRelations() : objectBox2.getRelations(),
        builder: (context,snapshot){
          if(snapshot.data?.isNotEmpty ?? false ){
            return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.hasData ? snapshot.data!.length : 0,
                itemBuilder: (BuildContext context,int index){
              return  Card(
                  child: Column(
                    children: <Widget>[
                      Text(snapshot.data![index].title),
                      Text('id ${snapshot.data![index].id.toString()}'),
                      Text('internal_id ${snapshot.data![index].internalId.toString()}'),
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