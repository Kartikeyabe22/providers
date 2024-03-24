

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerPackage/providers.dart';
import 'package:providerPackage/selected_movies.dart';

class ProviderTutorial extends StatefulWidget {
  const ProviderTutorial({super.key});

  @override
  State<ProviderTutorial> createState() => _ProviderTutorialState();
}

class _ProviderTutorialState extends State<ProviderTutorial> {
  @override
  Widget build(BuildContext context) {
    //ab agar koi bhi changes favlist me hoga to fav use watch karega
    var fav= context.watch<MovieProviders>().favlist;
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Movie ${fav.length}'),
      ),
      body: ListView.builder(
         itemCount: 40,
          itemBuilder: (context,index){
           return ListTile(
             title: Text("Movie${index}"),
             trailing: GestureDetector(

             onTap: (){
                   if(!fav.contains(index))
                     {
                       context.read<MovieProviders>().addtoList(index);
                     }
                   else{
                     context.read<MovieProviders>().removeFav(index);
                   }
                   },
               child:   Icon(Icons.favorite,color: fav.contains(index)?Colors.red:Colors.grey,),
             ),
           );
          }
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>AnotherScreen()));
          }),
    );
  }
}
