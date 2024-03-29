#!/usr/bin/env bash

tee secrets/defaults.json.age.template <<EOF
{
    "credentials": {
        "default": "pass",
        # mkpasswd -s pass
        "user": {
            "hashedPassword": "$y$j9T$ggTDbNiJqitGmGTMzow9T.$7kY94tHHR0V/A/OF6Ys.qq9yqnTzkC6G.pWMwr/Y426"
        },
        "root": {
            "hashedPassword": "$y$j9T$ggTDbNiJqitGmGTMzow9T.$7kY94tHHR0V/A/OF6Ys.qq9yqnTzkC6G.pWMwr/Y426"
        }
    }
}
EOF

RULES="./secrets/secrets.nix" nix run github:ryantm/agenix -- -e "defaults.json.age"
