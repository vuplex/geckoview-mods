# GeckoView Mod Script

[3D WebView for Android with Gecko Engine](https://developer.vuplex.com/webview/overview) uses the Mozilla [GeckoView](https://mozilla.github.io/geckoview/) library to embed the Gecko browser engine. 3D WebView uses [GeckoView builds from Mozilla](https://maven.mozilla.org/?prefix=maven2/org/mozilla/geckoview/geckoview/) but uses this repo's remove-gms.sh script to remove references to Google Mobile Services due to the [issue described in this Bugzilla issue](https://bugzilla.mozilla.org/show_bug.cgi?id=1700817).

## Example usage

```
# Produces a file in the current directory named geckoview-without-gms.aar
./remove-gms.sh ~/Desktop/geckoview-95.0.20211215221728.aar
```
