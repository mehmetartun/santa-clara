# Troubleshooting

## iOS

Sometimes iOS will complain about pod repo being out of sync. You can run this from the top level directory in your project.
```zsh
    cd ios
    rm -rf Podfile.lock
    rm -rf Pods
    rm -rf .symlinks
    pod cache clean --all
    pod deintegrate
    cd ..
    flutter pub get
    cd ios
    pod setup
    pod install --repo-update
    cd ..
```
This will force all pods to be installed again from fresh.