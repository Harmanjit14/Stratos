import 'package:Stratos/Models/user.dart';
import 'package:graphql/client.dart';

Future<int> me() async {
  final _httpLink = HttpLink(
    'https://loca-ly.herokuapp.com/api/',
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
    email
    profile{
      name
    }
  }
}
""";
  QueryOptions tokenGet = QueryOptions(
    document: gql(getAuthToken),
  );
  print("\n\nstarted\n\n");

  QueryResult result = await _client.query(tokenGet);
  if (result.hasException) {
    print(result.exception);
    return 0;
  } else {
    //TODO

    return 1;
  }
}
