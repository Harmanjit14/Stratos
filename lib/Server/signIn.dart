import 'package:Stratos/Models/user.dart';
import 'package:graphql/client.dart';

Future<int> getToken(String email, String password) async {
  final _httpLink = HttpLink(
    'https://stratos-backend.herokuapp.com/api',
  );

  final AuthLink authLink = AuthLink(
    getToken: () async => '',
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
  print(email);
  print(password);
  MutationOptions tokenGet = MutationOptions(
    document: gql(getAuthToken),
  );
  print("0");
  QueryResult result = await _client.mutate(tokenGet);
  if (result.hasException) {
    print("2");
    print(result.exception);
    return 0;
  } else {
    print("1");
    token = result.data["tokenAuth"]["token"];
    return 1;
  }
}
