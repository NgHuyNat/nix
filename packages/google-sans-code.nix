# Google Sans Code font package
{ lib, stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "google-sans-code";
  version = "6.001";

  src = fetchFromGitHub {
    owner = "googlefonts";
    repo = "googlesans-code";
    rev = "v6.001";
    sha256 = "0b97nxarhjbj9bfldlq2pmic1knwcv9fqw3c9naizxvjxgx73ha9";
  };

  installPhase = ''
    runHook preInstall
    
    mkdir -p $out/share/fonts/truetype
    find . -name "*.ttf" -exec install -m644 {} $out/share/fonts/truetype/ \;
    
    runHook postInstall
  '';

  meta = with lib; {
    description = "Google Sans Code - A fixed-width, geometric sans-serif typeface designed for code";
    homepage = "https://github.com/googlefonts/googlesans-code";
    license = licenses.ofl;
    platforms = platforms.all;
    maintainers = [];
  };
}
