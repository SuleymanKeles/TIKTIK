/*
    THIS CLASS CREATED FOR TRANSFER DATA IN NAVIGATOR.

    HOW TO USE :
    1. use with pushNamed func.
    2. add arguments parameter.

    Edit data type
        Data Type is "Which screen is sending data to?"

    Edit data
        Data is "Data Key in server"


    EXAMPLE

    Navigator.pushNamed(
        context,
        '/productDetailScreen',
        arguments: ScreenArguments(
          dataType: 'product',
          data: '0005314',
         ),
    );

*/
class ScreenArguments {
  final String dataType;
  final String data;

  ScreenArguments({
    required this.dataType,
    required this.data,
  });
}
