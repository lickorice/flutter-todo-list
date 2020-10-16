part of MainApp;

// This whole part is where the home page is made
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // aligns the children in the column to the center of y-axis
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "Todo List",
                style: TextStyle(
                  //applies style to your text
                  fontSize: 40,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),

          //this part tells the button where to go when pressed
          GestureDetector(
            onTap: () {
              setState(() {});
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        TodoList()), // when pressed, goes to TodoList
              );
            },

            //This part just designs the button
            child: Center(
              child: Container(
                width: 150.0,
                height: 60.0,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.transparent),
                  color: Color(0xFF42A5F5),
                  borderRadius: BorderRadius.all(
                      Radius.circular(10.0) //         <--- border radius here
                      ),
                ),
                child: Icon(Icons.arrow_forward_ios, color: Colors.white70, size: 30),
              ),
            ),
          ),
        ],
      ),
    );
  }
}