import 'package:flutter/material.dart';
import 'package:gauge_indicator/gauge_indicator.dart';

class MyRadialGauge extends StatelessWidget {
  const MyRadialGauge({super.key});

  @override
  Widget build(BuildContext context) {
    return const AnimatedRadialGauge(
      /// The animation duration.
      duration: Duration(seconds: 1),
      curve: Curves.elasticOut,

      /// Define the radius.
      /// If you omit this value, the parent size will be used, if possible.
      radius: 50,

      /// Gauge value.
      value: 400,

      /// Optionally, you can configure your gauge, providing additional
      /// styles and transformers.
      axis: GaugeAxis(

          /// Provide the [min] and [max] value for the [value] argument.
          min: 0,
          max: 1000,

          /// Render the gauge as a 180-degree arc.
          degrees: 180,

          /// Set the background color and axis thickness.
          style: GaugeAxisStyle(
            thickness: 15,
            background: Color(0xFFDFE2EC),
            segmentSpacing: 4,
          ),

          /// Define the pointer that will indicate the progress (optional).
          pointer: GaugePointer.needle(
            width: 10,
            height: 30,
            borderRadius: 16,
            color: Colors.black,
          ),

          /// Define the progress bar (optional).
          progressBar: GaugeProgressBar.rounded(
            color: Colors.transparent,
          ),

          /// Define axis segments (optional).
          segments: [
            GaugeSegment(
              from: 0,
              to: 200,
              color: Colors.red,
              cornerRadius: Radius.zero,
            ),
            GaugeSegment(
              from: 200,
              to: 600,
              color: Colors.orangeAccent,
              cornerRadius: Radius.zero,
            ),
            GaugeSegment(
              from: 600,
              to: 1000,
              color: Colors.green,
              cornerRadius: Radius.zero,
            ),
          ]

          /// You can also, define the child builder.
          /// You will build a value label in the following way, but you can use the widget of your choice.
          ///
          /// For non-value related widgets, take a look at the [child] parameter.
          /// ```
          /// builder: (context, child, value) => RadialGaugeLabel(
          ///  value: value,
          ///  style: const TextStyle(
          ///    color: Colors.black,
          ///    fontSize: 46,
          ///    fontWeight: FontWeight.bold,
          ///  ),
          /// ),
          /// ```
          ),
    );
  }
}
