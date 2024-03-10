{ stdenv
, fetchFromGitHub
, autoreconfHook
, lib
, darwin
, xorg
,
}:
stdenv.mkDerivation rec {
  name = "aplus";
  version = "4.20.0-05b6c4f";

  src = fetchFromGitHub {
    owner = "PlanetAPL";
    repo = "a-plus";
    rev = "05b6c4f";
    sha256 = "sha256-zNDqAOLERZsvJXiHj2ReAQyLZwf3Ewri/awXn9brT/o";
  };

  # Apply patch aplus-fsf_4.22.1-10.2.diff.gz
  patches = [ ./aplus-fsf_4.22.1-10.2.diff ];


  # postPatch = ''
  #   substituteInPlace src/MSTypes/MSFloat.H \
  #     --replace "finite(r_)" "isfinite(r_)"
  #   substituteInPlace src/MSTypes/MSBuiltinVectorImpl.C \
  #     --replace "finite(" "isfinite("
  #   substituteInPlace src/MSTypes/MSFloat.C \
  #     --replace "finite(" "isfinite("
  #   substituteInPlace src/MSTypes/MSFloatMatrix.H \
  #     --replace " void *clientData_=0" " void *clientData_"
  #   substituteInPlace src/MSTypes/MSFloatMatrix.H \
  #     --replace "#if !defined(MS_NO_PREDECLARE_SPECIALIZATION)" "#if 0"
  #   substituteInPlace src/MSTypes/MSObservableTree.C \
  #     --replace " position(" " this->position("
  #   substituteInPlace src/MSTypes/MSObservableTree.C \
  #     --replace "=position(" "=this->position("
  #   substituteInPlace src/MSTypes/MSObservableTree.C \
  #     --replace ",position(" ",this->position("
  #   substituteInPlace src/MSTypes/MSObservableTree.C \
  #     --replace "isRoot(" "this->isRoot("
  #   substituteInPlace src/MSGUI/MSGraphUI.C \
  #     --replace "trace->legend()>0" "trace->legend()!=nullptr"
  #   substituteInPlace src/MSTypes/MSBinaryMatrix.C \
  #     --replace "if (mp>0)" "if (mp != nullptr)"
  #   substituteInPlace src/MSTypes/MSObjectTypeVectorInlines.C \
  #     --replace "return compress (" "return this->compress ("
  #   substituteInPlace src/MSTypes/MSBuiltinTypeVectorInlines.C \
  #     --replace "return compress (" "return this->compress ("
  #   substituteInPlace src/MSTypes/MSFloat.C \
  #     --replace "  char *decimal=strchr(" "  const char *decimal=strchr("
  #   substituteInPlace src/MSTypes/MSFloat.C \
  #     --replace "  char	*np,buf[512];" "  const char	*np; char buf[512];"
  #   substituteInPlace src/MSTypes/MSUtil.C \
  #     --replace "  char *cp;" "  const char *cp;"
  #   substituteInPlace src/main/aplus_uext.c \
  #     --replace "  uextInstall()" "  int uextInstall()"
  #   substituteInPlace src/MSIPC/MSListener.C \
  #     --replace "(bind(" "(::bind("
  # '';

  buildInputs = [ xorg.libX11 ] ++
    lib.optionals stdenv.isDarwin [ darwin.apple_sdk.frameworks.CoreServices ];
  nativeBuildInputs = [ autoreconfHook ];
  # configureFlags = [ "CXXFLAGS=-std=c++98" "CFLAGS=-std=c89" ];
  configureFlags = [
    "--x-includes=${xorg.libX11.dev}/include"
    "--x-libraries=${xorg.libX11.out}/lib"
  ];
  # NIX_CFLAGS_COMPILE = "-Wno-format-security -Wno-int-conversion -Wno-implicit-function-declaration -ferror-limit=200 -Wno-register -Wno-c++11-narrowing -Wno-implicit-int";
}
