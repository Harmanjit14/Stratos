import 'package:Stratos/Models/user.dart';
import 'package:graphql/client.dart';

Future<int> createUser(String email, String password) async {
  final _httpLink = HttpLink(
    'https://loca-ly.herokuapp.com/api/',
  );

  final AuthLink authLink = AuthLink(
    getToken: () async => 'JWT ',
    // OR
    // getToken: () => 'Bearer <YOUR_PERSONAL_ACCESS_TOKEN>',
  );
  final Link link = authLink.concat(_httpLink);
  GraphQLClient _client = GraphQLClient(
    cache: GraphQLCache(),
    link: link,
  );

  String getAuthToken = """
 mutation{
  createUser(email: "$email" ,password: "$password" ){
    __typename
  }
}
""";
  MutationOptions tokenGet = MutationOptions(
    document: gql(getAuthToken),
  );

  QueryResult result = await _client.mutate(tokenGet);
  if (result.hasException) {
    print(result.exception);
    return 0;
  } else {
    print("done");
    return 1;
  }
}

