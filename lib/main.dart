import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payment_app/theme.dart';

void main() {
  runApp(PaymentApp());
}

class PaymentApp extends StatefulWidget {
  const PaymentApp({Key? key}) : super(key: key);

  @override
  _PaymentAppState createState() => _PaymentAppState();
}

class _PaymentAppState extends State<PaymentApp> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    Widget option(
      int index,
      String title,
      String subTitle,
      String pricing,
    ) {
      return GestureDetector(
        onTap: () {
          setState(() {
            selectedIndex = index;
          });
        },
        child: Container(
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.only(top: 20, right: 20, left: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: selectedIndex == index
                    ? Color(0xff007DFF)
                    : Color(0xff40587C),
              )),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      selectedIndex == index
                          ? Image.asset(
                              'assets/ic_select_active.png',
                              width: 18,
                              height: 18,
                            )
                          : Image.asset(
                              'assets/ic_select.png',
                              width: 18,
                              height: 18,
                            ),
                      SizedBox(
                        width: 16,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: planTextStyle,
                          ),
                          Text(
                            subTitle,
                            style: descTextStyle,
                          )
                        ],
                      ),
                    ],
                  ),
                  Text(
                    pricing,
                    style: priceTextStyle,
                  )
                ],
              )
            ],
          ),
        ),
      );
    }

    Widget header() {
      return (Padding(
        padding: const EdgeInsets.only(top: 50, left: 32, right: 32),
        child: Column(
          children: [
            Center(
              child: Image.asset(
                'assets/illus-1.png',
                width: 267,
                height: 200,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Upgrade to',
                  style: titleTextStyle,
                ),
                SizedBox(
                  width: 6,
                ),
                Text(
                  'Pro',
                  style: proTextStyle,
                )
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Text('Go unlock all features and \nbuild your own business bigger',
                style: subTitleTextStyle, textAlign: TextAlign.center),
          ],
        ),
      ));
    }

    Widget checkoutButton() {
      return Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 50, left: 20, right: 20),
            width: double.infinity,
            decoration: BoxDecoration(
                color: Color(0xff007DFF),
                borderRadius: BorderRadius.circular(70)),
            child: TextButton(
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    'Checkout Now',
                    style: buttonTextStyle,
                  ),
                )),
          ),
        ],
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Color(0xff04112F),
          body: SingleChildScrollView(
            child: Column(
              children: [
                header(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    children: [
                      option(0, 'Monthly', 'Good for starting up', '\$20'),
                      option(1, 'Quarterly', 'Focusing on building', '\$55'),
                      option(2, 'Yearly', 'Steady company', '\$220'),
                      selectedIndex == -1 ? SizedBox() : checkoutButton()
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
