import 'package:flutter/material.dart';
import 'package:noli/components/misc.dart';
import 'package:noli/pages/reasons_page.dart';

class MomentPage extends StatefulWidget {
  const MomentPage({super.key});

  @override
  State<MomentPage> createState() => _MomentPageState();
}

class _MomentPageState extends State<MomentPage> {
  double _value = 1;

  var faces = [
    Image.asset('images/bad_gif.gif'),
    Image.asset('images/mid_gif.gif'),
    Image.asset('images/good_gif.gif')];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          color: Colors.cyan,
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Hi Andrew, something on your mind?',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
                width: 500,
                height: 500,
                child: faces[_value.toInt()]),
            // Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('images/bad2.png', height: 75, width: 75,),
                Container(
                  width: MediaQuery.of(context).size.width/2,
                  child: SliderTheme(
                    data: SliderThemeData(
                      trackHeight: 8,
                      thumbShape: CustomThumbShape()
                    ),
                    child: Slider(
                      min: 0,
                      max: 2,
                      divisions: 2,
                      activeColor: Colors.grey[400],
                      inactiveColor: Colors.grey[400],
                      thumbColor: Colors.white,
                      value: _value,
                      onChanged: (value) {
                        setState(() {
                          _value = value;
                        });
                      },
                    ),
                  ),
                ),
                Image.asset('images/good2.png', height: 75, width: 75,),
              ],
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ReasonsPage()));
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 40),
                decoration: BoxDecoration(
                    color: Colors.cyan,
                    borderRadius: BorderRadius.all(Radius.circular(50))
                ),
                height: 50,
                width: MediaQuery.of(context).size.width - 200,
                child: Center(
                  child: Text(
                      'Continue'
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
