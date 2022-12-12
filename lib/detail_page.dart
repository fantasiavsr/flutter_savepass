import 'package:flutter/material.dart';
import 'package:savepass/edit_page.dart';
import 'package:savepass/main_page.dart';
import 'package:clipboard/clipboard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
/* import 'package:firebase_auth/firebase_auth.dart'; */

class DetailPage extends StatefulWidget {
  final String id, type, username, password, note;

  const DetailPage(
      {Key? key,
      required this.id,
      required this.type,
      required this.username,
      required this.password,
      required this.note})
      : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  /* final TextEditingController _usernameController = TextEditingController(); */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFFffffff)),
          onPressed: () => Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const MainPage()),
            (Route<dynamic> route) => false,
          ),
        ),
        title: const Text(''),
        backgroundColor: const Color(0xFF4361EE),
        elevation: 0,
      ),
      // ignore: sized_box_for_whitespace
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          /* padding: const EdgeInsetsDirectional.fromSTEB(30, 70, 30, 0), */
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /* Title Type */
              Container(
                width: double.infinity,
                height: 130,
                color: const Color(0xFF4361EE),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(widget.type,
                          style: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          )),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(30, 32, 30, 24),
                child: TextFormField(
                  enabled: false,
                  initialValue: widget.username,
                  decoration: InputDecoration(
                    fillColor: const Color(0xffEEEEEE),
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 0,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0xff4361EE),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    /* prefixIcon: const Icon(
                      Icons.email,
                      color: Color(0xff191E23),
                    ), */
                    labelText: 'Username',
                    labelStyle: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      color: Color(0xff191E23),
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
              /* Password Textfield */
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(30, 0, 30, 24),
                child: TextFormField(
                  enabled: false,
                  /* controller: _passwordController, */
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  initialValue: widget.password,
                  decoration: InputDecoration(
                    fillColor: const Color(0xffEEEEEE),
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 0,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0xff4361EE),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    /* prefixIcon: const Icon(
                      Icons.email,
                      color: Color(0xff191E23),
                    ), */
                    labelText: 'Password',
                    labelStyle: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      color: Color(0xff191E23),
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(30, 0, 30, 24),
                child: ElevatedButton(
                  onPressed: () {
                    FlutterClipboard.copy(widget.password).then(
                        (value) => ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Password Copied'),
                              ),
                            ));
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: const Color(0xffffffff),
                    fixedSize: Size(MediaQuery.of(context).size.width, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Copy Password',
                    style: TextStyle(
                      color: Color(0xff4361EE),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              /* Note Textfield */
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(30, 0, 30, 24),
                child: TextFormField(
                  enabled: false,
                  /* controller: _passwordController, */
                  obscureText: false,
                  enableSuggestions: false,
                  autocorrect: false,
                  initialValue: widget.note,
                  decoration: InputDecoration(
                    fillColor: const Color(0xffEEEEEE),
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 0,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0xff4361EE),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    /* prefixIcon: const Icon(
                      Icons.email,
                      color: Color(0xff191E23),
                    ), */
                    labelText: 'Note',
                    labelStyle: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      color: Color(0xff191E23),
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
              /* BUtton */
              Column(
                /* mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center, */
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 80, 0, 20),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              30, 0, 30, 0),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EditPage(
                                    username: widget.username,
                                    password: widget.password,
                                    note: widget.note,
                                    type: widget.type,
                                    id: widget.id,
                                  ),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.black,
                              backgroundColor: const Color(0xff4361EE),
                              fixedSize:
                                  Size(MediaQuery.of(context).size.width, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text(
                              'Edit',
                              style: TextStyle(
                                color: Color(0xffffffff),
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              30, 0, 30, 0),
                          child: ElevatedButton(
                            onPressed: () {
                              showGeneralDialog(
                                barrierLabel: "Label",
                                barrierDismissible: true,
                                barrierColor: Colors.black.withOpacity(0.5),
                                transitionDuration:
                                    const Duration(milliseconds: 700),
                                context: context,
                                pageBuilder:
                                    (context, animation, secondaryAnimation) =>
                                        Center(
                                  child: AlertDialog(
                                    title: const Text('Hapus Data'),
                                    content: const Text(
                                        'Apakah anda yakin ingin menghapus data ini?'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text('Tidak'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          CollectionReference kode =
                                              FirebaseFirestore.instance
                                                  .collection('kode');
                                          kode.doc(widget.id).delete();
                                          Navigator.pop(context);
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const MainPage(),
                                            ),
                                          );
                                        },
                                        child: const Text('Ya'),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                              /* CollectionReference kode =
                                  FirebaseFirestore.instance.collection('kode');
                              kode.doc(widget.id).delete();
                              Navigator.pop(context); */
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.black,
                              backgroundColor: const Color(0xffffffff),
                              fixedSize:
                                  Size(MediaQuery.of(context).size.width, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text(
                              'Hapus',
                              style: TextStyle(
                                color: Color(0xfEE4343E),
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
