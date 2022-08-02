let
  ledgerPlatform = import (fetchTarball "https://github.com/obsidiansystems/ledger-platform/archive/develop.tar.gz") {};
  ledgerctl = ledgerPlatform.ledgerctl;
  this = ./.;
in
ledgerPlatform.pkgs.writeScriptBin "load-app" ''
  #!/usr/bin/env bash

  cd ${this}
  ${ledgerctl}/bin/ledgerctl install -f ${this}/app.json
''
