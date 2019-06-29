import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  static final routerName = '/welcome-screen';

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Expanded(
                flex: 5,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Translate',
                        style: TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 50.0,
                        ),
                      ),
                      Text(
                        '.',
                        style: TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 50.0,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 6,
                child: Container(
                  width: _screenWidth,
                  padding: EdgeInsets.only(
                    left: 15,
                    right: 15,
                  ),
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Spacer(
                          flex: 4,
                        ),
                        Expanded(
                          flex: 3,
                          child: Column(
                            children: <Widget>[
                              Text(
                                'Welcome',
                                style: TextStyle(
                                  fontFamily: 'Lato',
                                  fontSize: 20.0,
                                ),
                              ),
                              Text(
                                'Destroy the language barrier',
                                style: TextStyle(
                                  fontFamily: 'Lato',
                                  fontSize: 15.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Container(
                              padding: EdgeInsets.only(
                                right: 15,
                                left: 15,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                  Spacer(
                                    flex: 3,
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: RaisedButton(
                                      color: Colors.green,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                          10.0,
                                        ),
                                      ),
                                      child: Text(
                                        'Continue',
                                        style: TextStyle(
                                            fontFamily: 'Lato',
                                            fontSize: 15.0,
                                            color: Colors.white),
                                      ),
                                      onPressed: () {},
                                    ),
                                  ),
                                  Spacer(
                                    flex: 3,
                                  )
                                ],
                              )),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Spacer(
                flex: 1,
              )
            ],
          ),
          Column(
            children: <Widget>[
              Spacer(
                flex: 5,
              ),
              Expanded(
                flex: 2,
                child: Center(
                  child: Container(
                    width: 93,
                    height: 93,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.green,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(
                        30,
                      ),
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/translate.png'),
                      ),
                    ),
                  ),
                ),
              ),
              Spacer(
                flex: 7,
              )
            ],
          )
        ],
      ),
    );
  }
}
