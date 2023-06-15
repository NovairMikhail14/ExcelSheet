import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task3/colors_st.dart';

class AzkarView extends StatefulWidget {
  const AzkarView({Key? key}) : super(key: key);

  @override
  State<AzkarView> createState() => _AzkarViewState();
}

class _AzkarViewState extends State<AzkarView> {
  List<List<dynamic>> DataExcel=[];
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "السنه النبويه",
            style: TextStyle(
                color: AppColor.primaryColor,
                fontSize: 22,
                shadows: [
                  Shadow(
                      color: Colors.black38.withOpacity(0.5),
                      blurRadius: 9,
                      offset: Offset(0, 2)),
                ],
                fontWeight: FontWeight.w600),
          ),
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        body: Column(children: [
          headerUi(),
          Expanded(
            child: ListView.builder(
                itemCount: DataExcel!.length,
                itemBuilder: (BuildContext ctx, int index) {
                  var item = DataExcel![index];
                  return Container(
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.share),
                              Spacer(),
                              Text("$index")
                            ],
                          ),
                        ),
                        Text("${DataExcel[index]}")
                      ],
                    ),
                  );
                }),
          )

        ]),
      ),
    );
  }

  headerUi() {
    return Container(
      width: double.infinity,
      height: MediaQuery
          .of(context)
          .size
          .height * 0.15,
      padding: EdgeInsets.only(right: 14, top: 2),
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: AppColor.primaryColor.withOpacity(1),
                blurRadius: 9,
                offset: Offset(0, 20),
                spreadRadius: -20)
          ],
          color: AppColor.primaryColor,
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color.fromARGB(255, 30, 49, 9),
                AppColor.primaryColor.withOpacity(0.9)
              ]),
          borderRadius: BorderRadius.circular(15)),
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.menu_book,
                    color: Colors.white,
                    size: 20,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "الحديث الشريف",
                    style: Theme
                        .of(context)
                        .textTheme
                        .apply(bodyColor: Colors.white, fontSizeDelta: 2)
                        .bodyLarge,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
              Text(
                "﴿وَمَا يَنْطِقُ عَنِ الْهَوَى . إِنْ هُوَ إِلَّا وَحْيٌ يُوحَى﴾",
                style: Theme
                    .of(context)
                    .textTheme
                    .apply(bodyColor: Colors.white, fontSizeDelta: 1.9)
                    .bodyLarge,
              ),
            ],
          ),
          Positioned(
            child: Image.asset(""),
            left: 5,
            bottom: 0,
          )
        ],
      ),
    );
  }

  loadAssets() async{
    var myData = await rootBundle.loadString("");
    List<List<dynamic>> csvTable = CsvToListConverter(eol: "\n").convert(myData);
    setState(() {
      DataExcel = csvTable ;
    });
  }

}
