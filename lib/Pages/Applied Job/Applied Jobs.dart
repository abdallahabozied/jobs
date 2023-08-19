import 'package:flutter/material.dart';
import 'package:jobsque/Model/jobpost.dart';
import 'package:provider/provider.dart';

class Applied extends StatelessWidget {
  const Applied({super.key});

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<Jobs>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Applied"),
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(height: 20,
            decoration: BoxDecoration(
              color: Colors.grey,
            ),
            child:Center(child: Text("${prov.appliedjobcount} Applied Jobs",style: TextStyle(color: Colors.white),),),
          ),
          Container(
            width: MediaQuery.of(context).size.width*1,
            height: MediaQuery.of(context).size.height*0.6,
            child: ListView.builder(itemCount:prov.appliedjobs.length,itemBuilder: (context,i){
              return Card(
                  child: Consumer<Jobs>(builder: (context,value,child){
                    return ListTile(
                      leading:Image.network("${value.appliedjobs[i].image}"),
                      title: Text("Job_name ${value.appliedjobs[i].name}"),
                      trailing: IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: (){
                          prov.RemovefromApplied(value.appliedjobs[i]);
                        },
                      ),
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
