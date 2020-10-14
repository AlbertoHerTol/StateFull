import 'package:flutter/material.dart';
void main() => runApp(MyApp());

//------------------------------------------------------------
class Tarea extends StatefulWidget {
  var laTarea;
  Tarea(t){
    print("Constructor de la tarea"+t['nombre']);
    this.laTarea = t;
  }
  @override
  State<Tarea> createState() {
    print("Create state");
    return new TareaState(laTarea);
  }
}

class TareaState extends State<Tarea>{
  var tst;
  TareaState(ts){
    this.tst = ts;
  }

  click(){
    print("click");
    setState( () {
      tst['done'] = !tst['done'];
    });

  }
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left:20),
        //---------------------------------------
        child: Row(
            children:[
              if (tst['done'])
                FlatButton(
                    child: Icon(Icons.done),
                    onPressed: (){click();}
                )
              else
                FlatButton(
                    child: Icon(Icons.clear),
                    onPressed: (){click();}
                ),
              Text("  "+tst['nombre'])

            ]
        )
        /*
        child: Row(
            children:[
              if (tst['done'])
                IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: (){click();}
                )
              else
                IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: (){click();}
                ),
             Text("  "+tst['nombre'])

            ]
        )
*/
    /*
        child: Row(
          children:[
            if (tst['done'])
              Icon(Icons.done)
            else
              Icon(Icons.clear),
            FlatButton(
              onPressed: (){click();},
              child: Text("  "+tst['nombre'])
            ),
          ]
        )

     */


    );
  }
}


//----------------------------------------------------------




class MyApp extends StatelessWidget {

  var ListaTareas = {
    { "nombre": "Tarea 1", "done": true},
    { "nombre": "Tarea 2", "done": false},
    { "nombre": "Tarea 3", "done": true},
    { "nombre": "Tarea 4", "done": false},
    { "nombre": "Tarea 5", "done": true},
    { "nombre": "Tarea 6", "done": false},
    { "nombre": "Tarea 7", "done": true},
    { "nombre": "Tarea 8", "done": false},
    { "nombre": "Tarea 9", "done": true},
    { "nombre": "Tarea 10", "done": false}
  };




  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TAREAS',
      home: Scaffold(
        appBar: AppBar(
          title: Text('TAREAS'),
        ),
        body: ListView(
            children:[
              for (var m in ListaTareas)
                Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      ),
                    child: Row(
                        children: [Tarea (m)]
                    )
                )
            ]

        ),
        ),
      );
    
  }
}