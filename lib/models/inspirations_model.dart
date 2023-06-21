class Inspiration {
  //final int id;
  final String title;
  final String content;

  Inspiration({/*required this.id,*/ required this.title, required this.content});

  Map<String, dynamic> toMap() {
    return {
      //'id': id,
      'title': title,
      'content': content,
    };
  }

  // Implement toString to make it easier to see information about
  // each inspiration when using the print statement.
  @override
  String toString() {
    //return 'Inspiration{id: $id, title: $title, content: $content}';
    return 'Inspiration{title: $title, content: $content}';

  }
}
