import 'package:flutter/material.dart';
import 'package:searching/model/search_item_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SearchPage(),
    );
  }
}

class SearchPage extends StatefulWidget {
  const SearchPage({ Key? key }) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}
class _SearchPageState extends State<SearchPage> {

    static List<user_model> list_of_users=[
      user_model("Joanne Robinson","Member since 11/25/2019","assets/pp.jpg","...",),
      user_model("Joe Mike", "Member since 11/25/2019","assets/pp.jpg","...",),
      user_model("asther Johnson", "Member since 10/22/2020","assets/pp_sec.png","...",),
      user_model("Joseph Smith", "Member since 14/25/2020","assets/pp.jpg","...",),
      user_model("asther Johnson", "Member since 10/22/2020","assets/pp_sec.png","...",),
      user_model("Joseph Smith", "Member since 14/25/2020","assets/pp.jpg","...",),

    ];

    List<user_model> display_list=List.from(list_of_users);

   void updateList(String value){
      setState(() {
        display_list = list_of_users.where((element) => element.name!.toLowerCase().contains(value.toLowerCase())).toList();
      });
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 15, 15, 15),
      body: Padding(padding: EdgeInsets.fromLTRB(16,16,16,16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text("Add an Admin",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
              ),
            ),
            SizedBox(
              height:20.0
            ),
            TextField(
              onChanged: (value) => updateList(value),
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                 filled: true,
                 fillColor: Color.fromARGB(255, 42, 42,44),
                 border:OutlineInputBorder(
                   borderRadius:BorderRadius.circular(8.0),
                   borderSide: BorderSide.none,
                 ),
                 hintText: "name",
                 hintStyle: TextStyle(color: Color.fromARGB(255, 214, 213, 213)), 
                 prefixIcon: Icon(Icons.search,color: Color.fromARGB(255, 235, 230, 230),),
                // prefixIconColor: Color.fromARGB(255, 221, 27, 27),

              ),        
            ),
            SizedBox(height:20.0),
            Expanded(child:ListView.builder(
              itemCount: display_list.length,
              itemBuilder:(context, index) => ListTile(
                contentPadding: EdgeInsets.all(8.0),
                title: Text(
                  display_list[index].name!,
                   style:TextStyle(
                     color: Colors.white,
                     fontWeight: FontWeight.bold),
                     ),
                     subtitle: Text('${display_list[index].date_joined}',style:TextStyle(color:Colors.white60),),
                     trailing: Text("${display_list[index].end}",style:TextStyle(color:Colors.white)),
                     leading: Image.network(display_list[index].photo!),
              ), ),
            )
          ],
        )
      
      ),
    );
  }
}
