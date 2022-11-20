import 'package:flutter/material.dart';
import 'package:moduleprojekt/navigation.dart';

class BiletyPage extends StatefulWidget {
  const BiletyPage({Key? key}) : super(key: key);

  @override
  State<BiletyPage> createState() => _BiletyPageState();
}

class _BiletyPageState extends State<BiletyPage> {
  int currentIndex = 0;
  final screens = [
    ContentCard(
      icon1:Icons.flight_takeoff,
      icon2:Icons.flight_land,
      icon3:Icons.flight,
    ),
    ContentCard(
      icon1:Icons.train_outlined,
      icon2:Icons.train_rounded,
      icon3:Icons.train,
    ),
    ContentCard(
      icon1:Icons.bus_alert_outlined,
      icon2:Icons.bus_alert_rounded,
      icon3:Icons.directions_bus,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bilety'),
      ),
      drawer: WidgetNavigation('KowalXD','TomaszKowalski'),
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.flight),
            label: 'Flight',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.train),
            label: 'Train',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bus_alert_rounded),
            label: 'Bus',
          ),
        ],
      ),
    );;
  }
}
class ContentCard extends StatefulWidget {
  ContentCard({required this.icon1,required this.icon2,required this.icon3});
  final IconData icon1;
  final IconData icon2;
  final IconData icon3;
  @override
  _ContentCardState createState() => _ContentCardState();
}

class _ContentCardState extends State<ContentCard> {
  bool showInput = true;
  bool showInputTabOptions = true;
  @override
  Widget build(BuildContext context) {
    return new Card(
      elevation: 4.0,
      margin: const EdgeInsets.all(8.0),
      child: DefaultTabController(
        child: new LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
            return Column(
              children: <Widget>[
                _buildTabBar(),
                _buildContentContainer(viewportConstraints),
              ],
            );
          },
        ),
        length: 3,
      ),
    );
  }

  Widget _buildTabBar() {
    return Stack(
      children: <Widget>[
        new Positioned.fill(
          top: null,
          child: new Container(
            height: 2.0,
            color: new Color(0xFFEEEEEE),
          ),
        ),
        new TabBar(
          tabs: [
            Tab(text: showInputTabOptions ? "One way" : "Price"),
            Tab(text: showInputTabOptions ? "Round" : "Duration"),
            Tab(text: showInputTabOptions ? "Multicity" : "Stops"),
          ],
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey,
        ),
      ],
    );
  }

  Widget _buildContentContainer(BoxConstraints viewportConstraints) {
    return Expanded(
      child: SingleChildScrollView(
        child: new ConstrainedBox(
          constraints: new BoxConstraints(
            minHeight: viewportConstraints.maxHeight - 48.0,
          ),
          child: new IntrinsicHeight(
            child: showInput
                ? _buildMulticityTab(widget.icon1,widget.icon2)
                : PriceTab(
              height: viewportConstraints.maxHeight - 48.0,
              icon: widget.icon3,
              onPlaneFlightStart: () =>
                  setState(() => showInputTabOptions = false),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMulticityTab(icon1,icon2) {
    return Column(
      children: <Widget>[
        MulticityInput(icon1: icon1,icon2: icon2),
        Expanded(child: Container()),
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0, top: 8.0),
          child: FloatingActionButton(
            onPressed: () => setState(() => showInput = false),
            child: Icon(Icons.timeline, size: 36.0),
          ),
        ),
      ],
    );
  }
}
class MulticityInput extends StatelessWidget {
  MulticityInput({required this.icon1,required this.icon2});
  final IconData icon1;
  final IconData icon2;
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 64.0, 8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  icon: Icon(icon1, color: Colors.teal),
                  labelText: "From",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 64.0, 8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  icon: Icon(icon2, color: Colors.teal),
                  labelText: "To",
                ),
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        icon: Icon(icon2, color: Colors.teal),
                        labelText: "To",
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 64.0,
                  alignment: Alignment.center,
                  child: Icon(Icons.add_circle_outline, color: Colors.grey),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 64.0, 8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  icon: Icon(Icons.person, color: Colors.teal),
                  labelText: "Passengers",
                ),
              ),
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Icon(Icons.date_range, color: Colors.teal),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: TextFormField(
                      decoration: InputDecoration(labelText: "Departure"),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: TextFormField(
                      decoration: InputDecoration(labelText: "Arrival"),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
class PriceTab extends StatefulWidget {
  final VoidCallback onPlaneFlightStart;
  final double height;
  final IconData icon;
  const PriceTab({required this.height,required this.icon,required this.onPlaneFlightStart});

  @override
  State<PriceTab> createState() => _PriceTabState();
}

class _PriceTabState extends State<PriceTab> with TickerProviderStateMixin{
  final List<int> _flightStops = [1, 2, 3, 4];
  final double _cardHeight = 80.0;
  late AnimationController _dotsAnimationController;
  List<Animation<double>> _dotPositions = [];

  final double _initialPlanePaddingBottom = 16.0;
  final double _minPlanePaddingTop = 16.0;
  late AnimationController _planeSizeAnimationController;
  late AnimationController _planeTravelController;
  late Animation _planeSizeAnimation;
  late Animation _planeTravelAnimation;
  double get _planeTopPadding => _minPlanePaddingTop + (1 - _planeTravelAnimation.value) * _maxPlaneTopPadding;
  double get _maxPlaneTopPadding => widget.height - _initialPlanePaddingBottom - _planeSize;
  double get _planeSize => _planeSizeAnimation.value;

  @override
  void initState() {
    super.initState();
    _initSizeAnimations();
    _initPlaneTravelAnimations();
    _initDotAnimationController();
    _initDotAnimations();
    _planeSizeAnimationController.forward();
  }

  @override
  void dispose() {
    _planeSizeAnimationController.dispose();
    _planeTravelController.dispose();
    _dotsAnimationController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[_buildPlane()]
          ..addAll(_flightStops.map(_mapFlightStopToDot)),
      ),
    );
  }

  Widget _mapFlightStopToDot(stop) {
    int index = _flightStops.indexOf(stop);
    bool isStartOrEnd = index == 0 || index == _flightStops.length-1;
    Color color = isStartOrEnd ? Colors.red : Colors.green;
    return AnimatedDot(
      animation: _dotPositions[index],
      color: color,
    );
  }

  Widget _buildPlane() {
    return AnimatedBuilder(
        animation: _planeTravelAnimation,
        child: Column(
        children: <Widget>[
        AnimatedPlaneIcon(animation: _planeSizeAnimation,icon: widget.icon),
    Container(
      width: 2.0,
      height: _flightStops.length*_cardHeight*0.8,
      color: Color.fromARGB(255, 200, 200, 200),
    ),
    ],
    ),
    builder: (context,child) => Positioned(
    top: _planeTopPadding,
    child: child!,

    ),
    );
  }

  _initSizeAnimations() {
    _planeSizeAnimationController = AnimationController(
      duration: const Duration(milliseconds: 340),
      vsync: this,
    )..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(Duration(milliseconds: 500), () {
          widget?.onPlaneFlightStart();
          _planeTravelController.forward();
        });
        Future.delayed(Duration(milliseconds: 700), () { // <--- dots animation start
          _dotsAnimationController.forward();
        });
      }
    });
    _planeSizeAnimation = Tween<double>(begin: 60.0, end: 36.0).animate(CurvedAnimation(
      parent: _planeSizeAnimationController,
      curve: Curves.easeOut,
    ));
  }
  void _initDotAnimations() {
    //what part of whole animation takes one dot travel
    final double slideDurationInterval = 0.4;
    //what are delays between dot animations
    final double slideDelayInterval = 0.2;
    //at the bottom of the screen
    double startingMarginTop = widget.height;
    //minimal margin from the top (where first dot will be placed)
    double minMarginTop =
        _minPlanePaddingTop + _planeSize + 0.5 * (0.8 * _cardHeight);

    for (int i = 0; i < _flightStops.length; i++) {
      final start = slideDelayInterval * i;
      final end = start + slideDurationInterval;

      double finalMarginTop = minMarginTop + i * (0.8 * _cardHeight);
      Animation<double> animation = new Tween(
        begin: startingMarginTop,
        end: finalMarginTop,
      ).animate(
        new CurvedAnimation(
          parent: _dotsAnimationController,
          curve: new Interval(start, end, curve: Curves.easeOut),
        ),
      );
      _dotPositions.add(animation);
    }
  }

  void _initDotAnimationController() {
    _dotsAnimationController = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 500));
  }
  _initPlaneTravelAnimations() {
    _planeTravelController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _planeTravelAnimation = CurvedAnimation(
      parent: _planeTravelController,
      curve: Curves.fastOutSlowIn,
    );
  }
}
class AnimatedPlaneIcon extends AnimatedWidget {
  final IconData icon;
  AnimatedPlaneIcon({super.key,required animation,required this.icon}) : super(listenable: animation);
  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable as Animation<double>;
    //final IconData icon= as IconData;
    return Icon(
      icon,
      color: Colors.teal,
      size: animation.value,
    );
  }
}

class AnimatedDot extends AnimatedWidget {
  final Color color;

  AnimatedDot({
    super.key,
    required animation,
    required this.color,
  }) : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    Animation<double> animation = listenable as Animation<double>;
    return Positioned(
      top: animation.value,
      child: Container(
          height: 24.0,
          width: 24.0,
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(color: Color(0xFFDDDDDD), width: 1.0)),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: DecoratedBox(
              decoration: BoxDecoration(color: color, shape: BoxShape.circle),
            ),
          )),
    );
  }
}






