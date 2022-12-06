import 'package:flutter/material.dart';
import 'welcome_page.dart';
/* import 'main_page.dart';
import 'package:firebase_auth/firebase_auth.dart'; */

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyStatefulWidget(),
    );

    /* if (FirebaseAuth.instance.currentUser != null) {
      return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainPage(),
      );
    } else {
      return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyStatefulWidget(),
      );
    } */
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(67, 97, 238, 1),
      // ignore: sized_box_for_whitespace
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /* Logo */
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'images/savepass_logo.png',
                      width: 230.47,
                      height: 95.96,
                      fit: BoxFit.fitHeight,
                    ),
                  ],
                ),
              ),
              /* Desc */
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: const [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(24, 2, 24, 20),
                              child: Text(
                                'Your place to secure your data',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 22,
                                  color: Color(0xffffffff),
                                  fontWeight: FontWeight.w600,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(28, 2, 28, 20),
                              child: Text(
                                'SavePass merupakan aplikasi manajemen password pengguna untuk menghindari terjadinya pembajakan akun.',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                  color: Color(0xffffffff),
                                  fontWeight: FontWeight.w300,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              /* Bottom Column */
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  /* Button */
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                    child: ElevatedButton(
                      onPressed: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const WelcomePage(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.white,
                        fixedSize: const Size(310, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'Lanjut',
                        style: TextStyle(
                          color: Color.fromRGBO(67, 97, 238, 1),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  /* Caption */
                  const Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(80, 0, 80, 20),
                    child: Text(
                      'Saya menyetujui Syarat dan Ketentuan dan Kebijakan Privasi yang berlaku',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 10,
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
