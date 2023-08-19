import 'package:flutter/material.dart';
import 'package:jobsque/Model/jobpost.dart';
import 'package:provider/provider.dart';



class Saved extends StatefulWidget {
  const Saved({super.key});

  @override
  State<Saved> createState() => _SavedState();
}

class _SavedState extends State<Saved> {


  @override
  Widget build(BuildContext context) {

    var prov = Provider.of<Jobs>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
        title: Text("Saved"),
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(height: 20,
            decoration: BoxDecoration(
              color: Colors.grey,
            ),
            child:Center(child: Text("${prov.count} Job Saved",style: TextStyle(color: Colors.white),),),
          ),
          Container(
            width: MediaQuery.of(context).size.width*1,
            height: MediaQuery.of(context).size.height*0.6,
            child: ListView.builder(itemCount:prov.jobs.length ,itemBuilder: (context,i){
              return Card(
                  child: Consumer<Jobs>(builder: (context,value,child){
                    return ListTile(
                     leading:Image.network("${value.jobs[i].image}"),
                      title: Text("Jobtitle ${value.jobs[i].name}"),
                      subtitle: Text("Subtitle : ${value.jobs[i].job_type}"),
                      trailing: IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: (){
                          //context.read<Jobs>().Removefromsaved(list[i]);
                          prov.Removefromsaved(value.jobs[i]);
                        },
                      ),
                      // leading: Container(
                      //   width: 30,
                      //   height: 30,
                      //   child: Image.network(value.jobs[i].title),
                      // ),

                    );
                  })
              );
            }),
          ),
        ],
      ),
    );
  }
}
