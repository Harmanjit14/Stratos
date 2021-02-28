import 'package:Stratos/Models/user.dart';
import 'package:graphql/client.dart';
Map<DateTime, List> exerciseDays = {};
Future<int> getExercise() async {
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
      getexerciseinfo{
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
      print(result.data.toString());
      int day = result.data["getexerciseinfo"][0]["date"];
      int mon = result.data["getexerciseinfo"][0]["month"];
      int yr = result.data["getexerciseinfo"][0]["year"];
      DateTime x = DateTime(yr, mon, day);
      exerciseDays[x] = ["P"];
      return 1;
    } catch (e) {
      return 1;
    }
  }
}