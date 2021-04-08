import 'package:myflutter/infrastructure/abstract_types/api/abstract_api_request.dart';
import 'package:myflutter/infrastructure/abstract_types/api/abstract_api_response.dart';
import 'package:myflutter/infrastructure/api/requests/abstract_authenticated_request.dart';
import 'package:myflutter/model/token.dart';
import 'package:myflutter/model/user_register_dto.dart';

class RegisterRequest extends AbstractAuthenticatedRequest{
  final UserRegisterDto userRegisterDto;
  final Token token;

  RegisterRequest(this.userRegisterDto, this.token) : super(token);



  @override
  String getUrl() {
    // TODO: implement getUrl
    return "/api/users/register";
  }

  @override
  String getVerb() {
    // TODO: implement getVerb
    return "POST";
  }

  @override
  getBody() {
    // TODO: implement getBody
    return {
      "categorie": userRegisterDto.categorie,
      "createur": userRegisterDto.createur??"",
      "email": userRegisterDto.email,
      "nom": userRegisterDto.nom,
      "nomCommercial": userRegisterDto.nomCommercial,
      "nomPointVente": userRegisterDto.nomPointVente,
      "password": userRegisterDto.password,
      "prenom": userRegisterDto.prenom,
      "quartier": userRegisterDto.quartier??"",
      "region": userRegisterDto.region,
      "role": userRegisterDto.role,
      "telephone": userRegisterDto.telephone,
      "typeRegime": userRegisterDto.typeRegime,
      "username": userRegisterDto.username,
      "ville": userRegisterDto.ville??""
    };
  }

  @override
  parseResult(AbstractApiResponse response) {
    // TODO: implement parseResult
    print("-------------------------------------------");
    print(response.httpResponse.statusCode);
    return response.httpResponse.body;
  }

}