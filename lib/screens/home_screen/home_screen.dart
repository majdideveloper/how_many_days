import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime? bothOfDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('How Many Days'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 20.0,
            ),

            ElevatedButton(
              onPressed: () {
                showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.utc(1700),
                        lastDate: DateTime.now())
                    .then((date) {
                  setState(() {
                    bothOfDay = date;
                    showModalBottomSheet(
                        context: context,
                        builder: (BuildContext) {
                          return Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              height: MediaQuery.of(context).size.height/3,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  
                                  children: [
                                    Center(
                                      child: Text('you have lived in life ${calculteNumberOfDay(bothOfDay).toString()} Days !!!',
                                      style: TextStyle(fontSize: 30.0),
                                      textAlign: TextAlign.center,),
                                    ),
                                    
                                  ],
                                ),
                              ),
                            ),
                          );
                        });
                  });
                });
              },
              child: Text(
                'choose your both day',
                style: TextStyle(fontSize: 26.0),
              ),
            )
            
          ],
        ),
      ),
    );
  }
  int calculteNumberOfDay (DateTime? date){
    
   return DateTime.now().difference(date!).inDays;
    

  }
}
