import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
 MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: CardSlider(),
        ),
      ),
    );
  }
}


class CardSlider extends StatefulWidget {
  List<CardData> cardDataList = [
     CardData(
      imagePath:'https://scdn.comfy.ua/89fc351a-22e7-41ee-8321-f8a9356ca351/https://cdn.comfy.ua/media/catalog/product/u/a/ua-galaxy-m53-5g-sm-m536-sm-m536bzgdsek-532270366_1_.jpg/w_600',
      description: 'Смартфон Samsung Galaxy M53 5G 6/128GB Green (SM-M536BZGDSEK)',
      description2: 'Экран (6.6", TFT, 2408x1080) / Samsung Exynos 1280 (2.0 ГГц + 2.4 ГГц) / основная квадро-камера: 50 Мп + 5 Мп + 2 Мп + 2 Мп, фронтальная камера: 8 Мп / RAM 6 ГБ / 128 ГБ встроенной памяти + microSD (до 1 ТБ) / 3G / LTE / 5G / GPS / поддержка 2х SIM-карт (Nano-SIM) / Android 12 / 5000 мА*ч'
    ),
    CardData(
      imagePath: 'https://jabko.ua/image/cache/catalog/products/2022/09/072315/photo_2022-09-07_22-54-17%20(1)-1397x1397.jpg.webp',
      description: 'Apple iPhone 14 Pro Max 256GB (Deep Purple)',
    description2: 'Екран (6.7", OLED (Super Retina XDR), 2796x1290) / Apple A16 Bionic / основна квадро-камера: 48 Мп + 12 Мп + 12 Мп + 12 Мп, фронтальна камера: 12 Мп / 128 ГБ вбудованої пам\'яті / 3G / LTE / 5G / GPS / Nano-SIM / iOS 16'
    ),
    CardData(
      imagePath: 'https://jabko.ua/image/cache/catalog/products/2022/04/041252/iphone-13-pro-max-green-select%20(1)-1397x1397.jpg.webp',
      description: 'Apple iPhone 13 Pro Max 128GB (Alpine Green)',
    description2:'Айфон 13 Про Макс - це потужний флагманський смартфон від Apple з діагоналлю екрану 6,7 дюймів та роздільною здатністю 2778х1284 пікселів. Він оснащений процесором A15 Bionic, що забезпечує швидку та безперебійну роботу.'
    ),
    CardData(
      imagePath: 'https://cdn.27.ua/799/e5/6e/4384110_1.jpeg',
      description: 'Samsung Galaxy M52 6/128GB light blue (SM-M526BLBHSEK)',
    description2: 'Samsung Galaxy M52 - це потужний середньорівневий смартфон з діагоналлю екрану 6,7 дюймів та роздільною здатністю 2400x1080 пікселів. Він оснащений процесором Qualcomm Snapdragon 778G, що забезпечує швидку та ефективну роботу.'
    ),
  ];

  CardSlider();

  @override
  _CardSliderState createState() => _CardSliderState();
}

class _CardSliderState extends State<CardSlider> {
  int _currentIndex = 0;


  void _previousCard() {
    setState(() {
      _currentIndex = (_currentIndex == 0) ? widget.cardDataList.length - 1 : _currentIndex - 1;
    });
  }

  void _nextCard() {
    setState(() {
      _currentIndex = (_currentIndex == widget.cardDataList.length - 1) ? 0 : _currentIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return
    Container(
      color: Color.fromRGBO(50, 238, 207, 1),
      child:
     Column(
      children: [
       Container(
        height: 550,
        width: 350,
      decoration: BoxDecoration(
        color: Color.fromRGBO(0, 96, 91, 1),
        borderRadius: BorderRadius.circular(25.0),
      ),
          child:  Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(widget.cardDataList[_currentIndex].imagePath, width: 200,),
                SizedBox(height: 16.0, width: 100,),
                Text(widget.cardDataList[_currentIndex].description),
                Text(widget.cardDataList[_currentIndex].description2),

              ],
            ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
               child: const Text('Previous'),
              onPressed: _previousCard, style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 20),
            )),
            SizedBox(width: 16.0),
            TextButton(
               child: const Text('Next'),
              onPressed: _nextCard, style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 20),
            )),
          ],
        ),
      ],
    ));
  }
}

class CardData {
  final String imagePath;
  final String description;
  final String description2;

  CardData({required this.imagePath, required this.description, required this.description2});
}