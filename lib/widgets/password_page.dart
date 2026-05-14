import 'package:flutter/material.dart';

class PasswordPage extends StatelessWidget{
  const PasswordPage({super.key});

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
                onPressed: (){},
                backgroundColor: scheme.primary,
                child: Text('1')
              ),
              FloatingActionButton(
                onPressed: (){},
                backgroundColor: scheme.primary,
                child: Text('2')
              ),
              FloatingActionButton(
                onPressed: (){},
                backgroundColor: scheme.primary,
                child: Text('3')
              ),
            ]),
            
            Row(
              spacing: 8,
              mainAxisAlignment: .center,
              children: [
                FloatingActionButton(
                  onPressed: (){},
                  backgroundColor: scheme.primary,
                  child: Text('4')
                ),
                FloatingActionButton(
                  onPressed: (){},
                  backgroundColor: scheme.primary,
                  child: Text('5')
                ),
                FloatingActionButton(
                  onPressed: (){},
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
                  onPressed: (){},
                  backgroundColor: scheme.primary,
                  child: Text('7')
                ),
                FloatingActionButton(
                  onPressed: (){},
                  backgroundColor: scheme.primary,
                  child: Text('8')
                ),
                FloatingActionButton(
                  onPressed: (){},
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
                  onPressed: (){},
                  backgroundColor: scheme.primary,
                  child: Text('#')
                ),
                FloatingActionButton(
                  onPressed: (){},
                  backgroundColor: scheme.primary,
                  child: Text('0')
                ),
                FloatingActionButton(
                  onPressed: (){},
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