import 'package:Stratos/Models/user.dart';
import 'package:graphql/client.dart';

Map<DateTime, List> periodDays = {};

Future<int> getPeriodInfo() async {
  final _httpLink = HttpLink(
    'https://stratos-backend.herokuapp.com/graphql/',
  );

  final AuthLink authLink = AuthLink(
    getToken: () async => 'JWT $token',
  );

  final Link link = authLink.concat(_httpLink);
  GraphQLClient _client = GraphQLClient(
    cache: GraphQLCache(),
    link: link,
  );
  String createMutation = '''
    {
      getperiodinfo{
        date
        month
        year
      }
    }
''';
  QueryOptions createOptions = QueryOptions(
    document: gql(createMutation),
  );

  QueryResult result = await _client.query(createOptions);
  if (result.hasException) {
    print(result.exception);
    return 0;
  } else {
    try {
      int day = result.data["getperiodinfo"][0]["date"];
      int mon = result.data["getperiodinfo"][0]["month"];
      int yr = result.data["getperiodinfo"][0]["year"];
      DateTime x = DateTime(yr, mon, day);
      var y = x.add(Duration(days: 28));
      var y1 = x.add(Duration(days: 27));
      var y2 = x.add(Duration(days: 29));
      var z = y.add(Duration(days: 28));
      var z1 = y.add(Duration(days: 27));
      var z2 = y.add(Duration(days: 29));
      periodDays[x] = ["P"];
      periodDays[y1] = ["P"];
      periodDays[y2] = ["P"];
      periodDays[z1] = ["P"];
      periodDays[z2] = ["P"];
      periodDays[y] = ["P"];
      periodDays[z] = ["P"];
      return 1;
    } catch (e) {
      return 1;
    }
  }
}
