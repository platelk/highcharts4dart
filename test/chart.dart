import 'package:angular/angular.dart';
import 'package:angular/application_factory.dart';
import 'package:highcharts4dart/highcharts.dart';

@Injectable()
class GlobalController {
  var basicLineChart;

  GlobalController() {
    List series = [
        new Series()..numData = [7.0, 6.9, 9.5, 14.5,
        18.2, 21.5, 25.2, 26.5,
        23.3, 18.3, 13.9, 9.6]
          ..name = 'Tokyo'
          ..type = 'line',
        new Series()..numData = [-0.2, 0.8, 5.7, 11.3,
        17.0, 22.0, 24.8, 24.1,
        20.1, 14.1, 8.6, 2.5]
          ..name = 'New York'
          ..type = 'line',
        new Series()..numData = [-0.9, 0.6, 3.5, 8.4,
        13.5, 17.0, 18.6, 17.9,
        14.3, 9.0, 3.9, 1.0]
          ..name = 'Berlin'
          ..type = 'line',
        new Series()..numData = [3.9, 4.2, 5.7, 8.5,
        11.9, 15.2, 17.0, 16.6,
        14.2, 10.3, 6.6, 4.8]
          ..name = 'London'
          ..type = 'line'
    ];
    basicLineChart = new HighChart ()
                  ..title = (new Title ()
                              ..text = 'Basic Line')
                  ..chart = (new Chart ()
                              ..type = "line"
                              ..borderColor = "#CCC"
                              ..borderWidth = 1
                              ..borderRadius = 8
                              ..backgroundColor = "rgba(0,0,0,0)"
                             )
                  ..subtitle = (new Subtitle()
                                  ..text = 'Monthly Average Temperature'
                                  ..x = -20)
                  ..xAxis = (new XAxis()
                                  ..categories = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
                                                  'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'])
                  ..yAxis = (new YAxis ()
                                  ..title = (new AxisTitle()
                                                   ..text = "Temperature (ºC)"))
                  ..tooltip = (new Tooltip()
                                        ..valueSuffix = "ºC")
                  ..legend = (new Legend ()
                                        ..layout = "vertical"
                                        ..align = "right"
                                        ..verticalAlign = "middle"
                                        ..borderWidth = 0)
                  ..series = series;
  }
}

class AppModule extends Module {
  AppModule() {
    bind(HighChartComponent);
  }
}

void main() {
  var mainModule = new AppModule();

  applicationFactory().rootContextType(GlobalController).addModule(mainModule).run();
}