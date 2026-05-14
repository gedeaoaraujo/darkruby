import 'package:flutter/material.dart';

class PasswordPage extends StatelessWidget{
  PasswordPage({super.key});

  final TextEditingController password = .new();

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: Colors.red.shade900,
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          spacing: 16,
          mainAxisAlignment: .center,
          crossAxisAlignment: .center,
          children: [
            Text('Dark Ruby', style: .new(fontSize: 32)),
            Text('Write your password'),
            SizedBox(
              width: 200,
              child: TextField(
                showCursor: true,
                cursorColor: scheme.onPrimary,
                controller: password,
                decoration: .new(
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: .new(color: scheme.onPrimary, width: 1)
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: .new(color: scheme.onPrimary, width: 1)
                  ),
              )),
            ),
            
            Row(
              spacing: 8,
              mainAxisAlignment: .center,
              children: [
              FloatingActionButton(
                onPressed: ()=> password.text += '1',
                backgroundColor: scheme.primary,
                child: Text('1')
              ),
              FloatingActionButton(
                onPressed: ()=> password.text += '2',
                backgroundColor: scheme.primary,
                child: Text('2')
              ),
              FloatingActionButton(
                onPressed: ()=> password.text += '3',
                backgroundColor: scheme.primary,
                child: Text('3')
              ),
            ]),
            
            Row(
              spacing: 8,
              mainAxisAlignment: .center,
              children: [
                FloatingActionButton(
                  onPressed: ()=> password.text += '4',
                  backgroundColor: scheme.primary,
                  child: Text('4')
                ),
                FloatingActionButton(
                  onPressed: ()=> password.text += '5',
                  backgroundColor: scheme.primary,
                  child: Text('5')
                ),
                FloatingActionButton(
                  onPressed: ()=> password.text += '6',
                  backgroundColor: scheme.primary,
                  child: Text('6')
                ),
              ]
            ),
            
            Row(
              spacing: 8,
              mainAxisAlignment: .center,
              children: [
                FloatingActionButton(
                  onPressed: () => password.text += '7',
                  backgroundColor: scheme.primary,
                  child: Text('7')
                ),
                FloatingActionButton(
                  onPressed: () => password.text += '8',
                  backgroundColor: scheme.primary,
                  child: Text('8')
                ),
                FloatingActionButton(
                  onPressed: () => password.text += '9',
                  backgroundColor: scheme.primary,
                  child: Text('9')
                ),
              ]
            ),
            
            Row(
              spacing: 8,
              mainAxisAlignment: .center,
              children: [
                FloatingActionButton(
                  onPressed: () => password.text += '#',
                  backgroundColor: scheme.primary,
                  child: Text('#')
                ),
                FloatingActionButton(
                  onPressed: () => password.text += '0',
                  backgroundColor: scheme.primary,
                  child: Text('0')
                ),
                FloatingActionButton(
                  onPressed: (){
                    final text = password.text;
                    final subText = text.length-1;
                    password.text = text.substring(0, subText);
                  },
                  backgroundColor: scheme.primary,
                  child: Icon(Icons.backspace)
                )
              ]
            ),
        
            Row(
              spacing: 8,
              mainAxisSize: .max,
              mainAxisAlignment: .center,
              crossAxisAlignment: .center,
              children: [
                FloatingActionButton(
                  onPressed: (){},
                  backgroundColor: scheme.primary,
                  child: Icon(Icons.fingerprint)
                ),
                FloatingActionButton(
                  onPressed: (){},
                  backgroundColor: scheme.primary,
                  child: Icon(Icons.check_circle_outline)
                ),
              ]
            )
          ],
        ),
      )
    );
  }

}