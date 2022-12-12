import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:savepass/detail_page.dart';

class EditPage extends StatefulWidget {
  final String username, password, note, type, id;

  const EditPage(
      {Key? key,
      required this.username,
      required this.password,
      required this.note,
      required this.type,
      required this.id})
      : super(key: key);

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  bool _passVisibility = true;

  @override
  Widget build(BuildContext context) {
    final TextEditingController usernameController =
        TextEditingController(text: widget.username);
    final TextEditingController passwordController =
        TextEditingController(text: widget.password);
    final TextEditingController noteController =
        TextEditingController(text: widget.note);
    final TextEditingController typeController =
        TextEditingController(text: widget.type);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF4361EE)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Edit', style: TextStyle(color: Color(0xFF4361EE))),
        backgroundColor: const Color(0xFFF6F9F8),
        elevation: 0,
      ),
      body: Container(
        color: const Color(0xFFF6F9F8),
        child: SingleChildScrollView(
          padding: const EdgeInsetsDirectional.fromSTEB(30, 0, 30, 0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.9,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              /* mainAxisAlignment: MainAxisAlignment.start, */
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /* Type Textfield */
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 24),
                  child: TextFormField(
                    controller: typeController,
                    enabled: true,
                    /* initialValue: widget.type, */
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
                      labelText: 'Judul',
                      labelStyle: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        color: Color(0xff191E23),
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ),
                /* Text */
                const Text(
                  'Detail',
                  style: TextStyle(
                    color: Color(0xff4361EE),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                /* Username Textfield */
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 24),
                  child: TextFormField(
                    controller: usernameController,
                    enabled: true,
                    /* initialValue: widget.username, */
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
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 24),
                  child: TextFormField(
                    controller: passwordController,
                    enabled: true,
                    obscureText: _passVisibility,
                    enableSuggestions: false,
                    autocorrect: false,
                    /* initialValue: widget.password, */
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
                      suffixIcon: IconButton(
                        icon: Icon(
                          _passVisibility
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: const Color(0xff191E23),
                        ),
                        onPressed: () {
                          setState(() {
                            _passVisibility = !_passVisibility;
                          });
                        },
                      ),
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
                /* Generate Password Button */
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 24),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: const Color(0xffffffff),
                      fixedSize: Size(MediaQuery.of(context).size.width, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Generate Password',
                      style: TextStyle(
                        color: Color(0xff4361EE),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                /* Text */
                const Text(
                  'Tambahan',
                  style: TextStyle(
                    color: Color(0xff4361EE),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                /* Note Textfield */
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 24, 0, 24),
                  child: TextFormField(
                    controller: noteController,
                    enabled: true,
                    obscureText: false,
                    enableSuggestions: false,
                    autocorrect: false,
                    /* initialValue: widget.note, */
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
                const Spacer(),
                /* Button */
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 34),
                  child: ElevatedButton(
                    onPressed: () {
                      CollectionReference kode =
                          FirebaseFirestore.instance.collection('kode');
                      kode.doc(widget.id).update({
                        'username': usernameController.text,
                        'password': passwordController.text,
                        'note': noteController.text,
                      });
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPage(
                            id: widget.id,
                            type: typeController.text,
                            username: usernameController.text,
                            password: passwordController.text,
                            note: noteController.text,
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: const Color(0xff4361EE),
                      fixedSize: Size(MediaQuery.of(context).size.width, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Selesai',
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
        ),
      ),
    );
  }
}
