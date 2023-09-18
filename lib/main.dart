import 'package:flutter/material.dart';

void main() {
  runApp(PhotoGalleryApp());
}

class PhotoGalleryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Photo Gallery',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Photo Gallery'),
        ),
        body: PhotoGalleryScreen(),
      ),
    );
  }
}

class PhotoGalleryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Welcome to the Photo Gallery!',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.0),
          TextField(
            decoration: InputDecoration(
              labelText: 'Search for photos',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16.0),
          GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
            ),
            itemCount: 6,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Image ${index + 1} clicked!'),
                    ),
                  );
                },
                child: Card(
                  elevation: 2.0,
                  child: Column(
                    children: <Widget>[
                      Image.network('https://www.solutelabs.com/blog/fourteen-of-the-best-apps-built-using-flutter'),
                      // Placeholder URL
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Image ${index + 1}'),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          SizedBox(height: 16.0),
          Text(
            'Sample Photos:',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          ListTile(
            title: Text('Sample Photo 1'),
            subtitle: Text('A beautiful landscape'),
          ),
          ListTile(
            leading: Image.network('https://www.solutelabs.com/blog/fourteen-of-the-best-apps-built-using-flutter'),
            // Placeholder URL
            title: Text('Sample Photo 2'),
            subtitle: Text('A lovely sunset'),
          ),
          ListTile(
            leading: Image.network('https://www.solutelabs.com/blog/fourteen-of-the-best-apps-built-using-flutter'),
            // Placeholder URL
            title: Text('Sample Photo 3'),
            subtitle: Text('A cute puppy'),
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Photos Uploaded Successfully!'),
                ),
              );
            },
            child: Text('Upload Photos'),
          ),
        ],
      ),
    );
  }
}