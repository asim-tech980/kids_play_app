import 'package:flutter/material.dart';
import 'package:google_mlkit_digital_ink_recognition/google_mlkit_digital_ink_recognition.dart'
    as mlkit;

class DrawingScreen extends StatefulWidget {
  const DrawingScreen({super.key});
  @override
  State<DrawingScreen> createState() => _DrawingScreenState();
}

class _DrawingScreenState extends State<DrawingScreen> {
  final List<DrawingPoint> _points = [];
  bool _isLoading = false;
  String _detectedShape = '';

  mlkit.DigitalInkRecognizer? _recognizer;

  // marker properties
  Color selectedColor = Colors.blue;
  double strokeWidth = 6.0;

  @override
  void dispose() {
    _recognizer?.close();
    super.dispose();
  }

  Future<void> _ensureModel() async {
    if (_recognizer != null) return;

    const language = 'zxx-Zsym'; // shape / symbol recognition

    // create recognizer
    _recognizer = mlkit.DigitalInkRecognizer(languageCode: language);

    // download the model
    final modelManager = mlkit.DigitalInkRecognizerModelManager();
    bool isDownloaded = await modelManager.isModelDownloaded(language);
    if (!isDownloaded) {
      await modelManager.downloadModel(language);
    }
  }

  Future<void> _recognizeShape() async {
    if (_points.isEmpty) return;

    setState(() {
      _isLoading = true;
      _detectedShape = '';
    });

    try {
      await _ensureModel();

      final ink = mlkit.Ink();
      var stroke = mlkit.Stroke();

      for (var p in _points) {
        if (p.point != null) {
          stroke.points.add(
            mlkit.StrokePoint(
              x: p.point!.dx,
              y: p.point!.dy,
              t: DateTime.now().millisecondsSinceEpoch,
            ),
          );
        } else {
          if (stroke.points.isNotEmpty) {
            ink.strokes.add(stroke);
            stroke = mlkit.Stroke();
          }
        }
      }

      if (stroke.points.isNotEmpty) ink.strokes.add(stroke);

      final candidates = await _recognizer!.recognize(ink);

      if (candidates.isNotEmpty) {
        final top = candidates.first;
        setState(() {
          _detectedShape =
              '${top.text} (score: ${top.score?.toStringAsFixed(3) ?? 'n/a'})';
        });
      } else {
        setState(() {
          _detectedShape = 'No shape recognized';
        });
      }
    } catch (e) {
      setState(() {
        _detectedShape = 'Error: $e';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _clearCanvas() {
    setState(() {
      _points.clear();
      _detectedShape = '';
    });
  }

  void _addPoint(Offset p) {
    setState(() {
      _points.add(
        DrawingPoint(
          p,
          Paint()
            ..color = selectedColor
            ..strokeWidth = strokeWidth
            ..strokeCap = StrokeCap.round
            ..strokeJoin = StrokeJoin.round
            ..style = PaintingStyle.stroke, // Add this line
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Children Drawing'),
        actions: [
          IconButton(icon: const Icon(Icons.refresh), onPressed: _clearCanvas),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: GestureDetector(
              onPanStart: (d) => _addPoint(d.localPosition),
              onPanUpdate: (d) => _addPoint(d.localPosition),
              onPanEnd: (_) => _points.add(DrawingPoint(null, Paint())),
              child: CustomPaint(
                size: Size(
                  MediaQuery.of(context).size.width,
                  MediaQuery.of(context).size.height,
                ),
                painter: _Painter(_points),
              ),
            ),
          ),
          if (_isLoading) const LinearProgressIndicator(),
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.white,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _colorButton(Colors.red),
                    _colorButton(Colors.green),
                    _colorButton(Colors.blue),
                    _colorButton(Colors.black),
                  ],
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed:
                      _points.isEmpty || _isLoading ? null : _recognizeShape,
                  child: const Padding(
                    padding: EdgeInsets.all(12),
                    child: Text('Detect Shape', style: TextStyle(fontSize: 18)),
                  ),
                ),
                const SizedBox(height: 12),
                if (_detectedShape.isNotEmpty)
                  Text(
                    'Detected: $_detectedShape',
                    style: const TextStyle(fontSize: 18),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _colorButton(Color color) {
    final isSelected = selectedColor == color;
    return GestureDetector(
      onTap: () => setState(() => selectedColor = color),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 6),
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(
            width: isSelected ? 4 : 2,
            color: isSelected ? Colors.white : Colors.grey.shade700,
          ),
        ),
      ),
    );
  }
}

class DrawingPoint {
  final Offset? point;
  final Paint paint;

  DrawingPoint(this.point, this.paint);
}

class _Painter extends CustomPainter {
  final List<DrawingPoint> points;
  _Painter(this.points);

  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < points.length - 1; i++) {
      final current = points[i];
      final next = points[i + 1];

      if (current.point != null && next.point != null) {
        canvas.drawLine(current.point!, next.point!, current.paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant _Painter oldDelegate) => true;
}
