import 'package:Stratos/Models/user.dart';
import 'package:graphql/client.dart';

Future<int> getToken(String email, String password) async {
  final _httpLink = HttpLink(
    'https://loca-ly.herokuapp.com/api/',
  );

  final AuthLink authLink = AuthLink(
    getToken: () async => 'JWT $token',
  );

  final Link link = authLink.concat(_httpLink);
  GraphQLClient _client = GraphQLClient(
    cache: GraphQLCache(),
    link: link,
  );

  String getAuthToken = """
  mutation{
  tokenAuth(email: "$email" ,password: "$password" ){
    token
    refreshExpiresIn
  }
}
""";
  MutationOptions tokenGet = MutationOptions(
    // ignore: deprecated_member_use
    document: gql(getAuthToken),
  );

  QueryResult result = await _client.mutate(tokenGet);
  if (result.hasException) {
    print(result.exception);
    return 0;
  } else {
    token = result.data["tokenAuth"]["token"];
    return 1;
  }
}


