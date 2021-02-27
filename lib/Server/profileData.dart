import 'package:Stratos/Models/user.dart';
import 'package:graphql/client.dart';

Future<int> me() async {
  final _httpLink = HttpLink(
    'https://stratos-backend.herokuapp.com/api/',
  );

  final AuthLink authLink = AuthLink(
    getToken: () async => 'JWT $token',
    // OR
    // getToken: () => 'Bearer <YOUR_PERSONAL_ACCESS_TOKEN>',
  );
  final Link link = authLink.concat(_httpLink);
  GraphQLClient _client = GraphQLClient(
    cache: GraphQLCache(),
    link: link,
  );

  String getAuthToken = """
{
  me{
    name
    Height
    Weight
    BMI
    mobile
    Age
    Gender
    city
    state
  }
}
""";
  QueryOptions tokenGet = QueryOptions(
    document: gql(getAuthToken),
  );
  QueryResult result = await _client.query(tokenGet);
  if (result.hasException) {
    print(result.exception);
    return 0;
  } else {
    name = result.data["me"]["name"];
    height = result.data["me"]["Height"];
    weight = result.data["me"]["Weight"];
    bmi = result.data["me"]["BMI"];
    mobile = result.data["me"]["mobile"];
    city = result.data["me"]["city"];
    state = result.data["me"]["state"];
    female = (result.data["me"]["Gender"] == 'F') ? true : false;
    age = result.data["me"]["Age"];

    return 1;
  }
}
