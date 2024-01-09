import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

final player=AudioPlayer()..setReleaseMode(ReleaseMode.loop);

void main()=>runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final tabs=[
    screen1(),
    screen2(),
    screen3(),
    screen4(),
  ];

  int previousIndex=0;
  int currentIndex=0;

  @override
  Widget build(BuildContext context) {
    if (currentIndex==0) player.play(AssetSource("5.flac"));
    return MaterialApp(
      title: '我的自傳',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                       useMaterial3: true,),
      home: Scaffold(
        appBar: AppBar(title: Text('我的自傳'),),
        body: tabs[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.blue,
          selectedItemColor: Colors.white,
          selectedFontSize: 18,
          unselectedFontSize: 14,
          iconSize: 30,
          currentIndex: currentIndex,
          items: [
            BottomNavigationBarItem(icon: currentIndex==0?  Image.asset('images/c1.jpg',width:40,height:40):  Image.asset('images/c1.jpg',width:20,height:20), label:'自我介紹',),
            BottomNavigationBarItem(icon: Icon(Icons.school), label:'學習歷程',),
            BottomNavigationBarItem(icon: Icon(Icons.schedule_outlined), label:'學習計畫',),
            BottomNavigationBarItem(icon: Icon(Icons.engineering), label:'專業方向',),
          ],
          onTap: (index) {
            setState(() {
              previousIndex=currentIndex;
              currentIndex=index;
              if (index==0) {
                if (previousIndex==currentIndex) player.resume();
                player.stop();
                player.play(AssetSource('5.flac'));
              }
              if (index==1) {
                if (previousIndex==currentIndex) player.resume();
                player.stop();
                player.play(AssetSource('2.flac'));
              }
              if (index==2) {
                if (previousIndex==currentIndex) player.resume();
                player.stop();
                player.play(AssetSource('3.flac'));
              }
              if (index==3) {
                if (previousIndex==currentIndex) player.resume();
                player.stop();
                player.play(AssetSource('4.flac'));
              }
            });
          },
        ),
      ),
    );
  }
}

class screen1 extends StatelessWidget {

  final String s1='        我的爸爸、叔叔、舅舅都是從事電子相關職業，在他們的耳濡目染下，讓我從小就對程式有非常大的興趣:我的母親做事非常認真，從小就教育我做事要全力以赴，拚盡全力，失敗只會使你更加強大；這句話仍然是我的座右銘，民主性的家庭教育讓我更學會凡事要對自己負責，唯有獨立自主，才不畏懼困難，面對挑戰。'
                  '國中時因為一些機緣巧合下參加了國中技藝班，並對實作產生了濃厚的興趣，也順利取得了技優生的資格，在上高中後，我在實習專業上更是得心應手，最後不讓老師們失望，成為選手代表學校去參加比賽。在社團中，我擔任監察長，管控學弟妹們送回的內外掃評分，深受老師和處室組長們的信任。'
                  '謙虛好學，積極友善是從國小到高中老師最常我的評價，也是我最棒的個人特質。我對實作練習非常有興趣，常常成為老師同學們的小幫手，也在高二有幸被選為選手代表學校參加集體創作技藝競賽，雖然名次不高，但是這次的失敗沒有打擊到我，後來參加了上銀機器手實作競賽取得優勝，也從旁驗證了我永不放棄的精神，和我的實作能力。在取得丙級證照後，我希望能證明自己的實力，所以去考取了乙級證照。在社團中擔任監察長，在這段時間，我學會了如何分配、管理所有社員的工作和進度，成為社團中的領導者之一。'
                  '「人生有夢，築夢踏實」。相信有明確目標，逐漸地去完成。希望我在高雄科技大學能學到在未來企業所需要的所有能力，及對未來科技趨勢前瞻性的靈敏度，以及努力練習英文，以便於培養未來國際化的能力。';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          //放標題
          Padding(
            padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
            child: Text('Who am I', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
          ),
          //自傳部份
          Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.fromLTRB(30, 0, 30, 50),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width:3),
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(color: Colors.amberAccent, offset: Offset(6, 6)),
              ],
            ),
            child: Text(s1, style: TextStyle(fontSize: 20)),
          ),
          SizedBox(height: 10,),
          //放一張照片
          Container(
            color: Colors.redAccent,
            child:Image.asset('images/c1.jpg'),
            height: 200,
            width: 200,
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 150,
                height:150,
                decoration: BoxDecoration(
                  border: Border.all(width:2, color: Colors.purple, style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(image: AssetImage('images/PXL_20231119_071120022.jpg'), fit: BoxFit.cover),
                ),
                //color: Colors.white,
              ),
              Container(
                width: 150,
                height:150,
                decoration: BoxDecoration(
                  border: Border.all(width:2, color: Colors.purple, style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(image: AssetImage('images/PXL_20231118_151408268.jpg'), fit: BoxFit.cover),
                ),
                //color: Colors.white,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scrollbar(child: SingleChildScrollView(
      child: Column( children: [
        Padding(
          padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
          child: Text('我的學習歷程', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('大學一年級', style: TextStyle(fontSize: 16,),)
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 120,
              child: ListView(
                children: [
                  Text('微積分'),
                  Text('C語言'),
                  Text('數位邏輯'),
                  Text('電子學'),
                  Text('電路學'),
                ],
              ),
            )
          ],
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('大學二年級', style: TextStyle(fontSize: 16,),)
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 150,
              child: ListView(
                children: [
                  Text('Python語言'),
                  Text('C++語言'),
                  Text('資料結構'),
                  Text('FPGA導論'),
                  Text('工程數學'),
                  Text('線性代數'),
                  Text('系統程式'),
                ],
              ),
            )
          ],
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('大學三年級', style: TextStyle(fontSize: 16,),)
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 150,
              child: ListView(
                children: [
                  Text('Matlab'),
                  Text('C++語言'),
                  Text('計算機結構'),
                  Text('非互動網頁程式'),
                  Text('APP程式設計'),
                  Text('人工智慧導論'),
                ],
              ),
            )
          ],
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('大學三年級', style: TextStyle(fontSize: 16,),)
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 150,
              child: ListView(
                children: [
                  Text('Matlab'),
                  Text('C++語言'),
                  Text('計算機結構'),
                  Text('非互動網頁程式'),
                  Text('APP程式設計'),
                  Text('人工智慧導論'),
                ],
              ),
            )
          ],
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('大學四年級', style: TextStyle(fontSize: 16,),)
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 150,
              child: ListView(
                children: [
                  Text('多媒體系統'),
                  Text('機器人導論'),
                  Text('演算法'),
                  Text('軟體工程'),
                  Text('大數據導論'),
                ],
              ),
            )
          ],
        ),

      ],),
    ));


    /*return Center(
      child: Container(child: Text('Screen2'),
      ),
    );*/
  }
}
class screen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('大一時期'),
          ],
        ),
        //SizedBox(height: 3,),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height:100,
              width: 200,
              child: ListView(
                children: [
                  Text('1. 練習英文'),
                  Text('2. 練習C語言基本語法'),
                  Text('3. 預習FPGA'),
                  Text('4. 搞好人際關係'),
                ],
              ),
            ),
          ],
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('大二時期'),
          ],
        ),
        //SizedBox(height: 1,),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height:100,
              width: 200,
              child: ListView(
                children: [
                  Text('1. 學好英文'),
                  Text('2. 練習C++語言中的SQL語法'),
                  Text('3. 練習FPGA，嘗試寫出小專案'),
                  Text('4. 開始尋找專題主題'),
                ],
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('大三時期'),
          ],
        ),
        //SizedBox(height: 1,),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height:100,
              width: 200,
              child: ListView(
                children: [
                  Text('1. 開始準備多益考試'),
                  Text('2. 準備專題    '),
                  Text('3. 練習FPGA，嘗試寫出小專案'),
                  Text('4. 開始尋找專題主題'),
                ],
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('大四時期'),
          ],
        ),
        //SizedBox(height: 1,),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height:100,
              width: 200,
              child: ListView(
                children: [
                  Text('1. 拿到多益證書'),
                  Text('2. 準備考取研究所'),
                  Text('3. 空閒時間考取證照'),
                  Text('4. 繼續閱讀英文雜誌，保持英文閱讀'),
                ],
              ),
            ),
          ],
        ),
        //Row(),
      ],),
    );
  }
}
class screen4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scrollbar(child: SingleChildScrollView(
      child: Column( children: [
        Padding(
          padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
          child: Text('我的專業方向', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 180,
              height:150,
              decoration: BoxDecoration(
                border: Border.all(width:2, color: Colors.blue, style: BorderStyle.solid),
                borderRadius: BorderRadius.circular(30),
                image: DecorationImage(image: AssetImage('images/c2.jpg'), fit: BoxFit.cover),
              ),
              //color: Colors.white,
            ),
            Container(
              width: 180,
              height:150,
              decoration: BoxDecoration(
                border: Border.all(width:2, color: Colors.purple, style: BorderStyle.solid),
                borderRadius: BorderRadius.circular(30),
                image: DecorationImage(image: AssetImage('images/content_004.jpg'), fit: BoxFit.cover),
              ),
              //color: Colors.white,
            ),
          ],
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              child: Text('程式工程師'),
            ),
            Container(
              child: Text('全端工程師'),
            )
          ],
        ),



      ],),
    ),
    );
    /*return Center(
      child: Container(child: Text('Screen4'),
      ),
    );*/
  }
}