# The one argument to this script is the path to the original GeckoView aar to use.
# First, unzip the aar and the classes.jar file within it.
unzip $1 -d unzippedAar
cd unzippedAar
unzip classes.jar -d unzippedJar
rm classes.jar
cd unzippedJar
# Modify WebAuthnTokenManager.class to change the path of the com.google.android.gms classes to com.vuplex.removed.xxx .
# Note that the length of the replacement path is the same length as the original path
# because that's required in order to be able to modify the raw .class file directly.
# Include LC_ALL=C to allow it to proceed even though it's a binary file.
LC_ALL=C sed -i '' 's/com\/google\/android\/gms\//com\/vuplex\/removed\/xxx\//g' org/mozilla/geckoview/WebAuthnTokenManager.class
# Zip classes.jar and the aar back up.
jar -cvf ../classes.jar org/
cd ..
rm -rf unzippedJar
cd ..
jar cvf geckoview-without-gms.aar -C unzippedAar .
rm -rf unzippedAar
echo ">>> finished generating geckoview-without-gms.aar"
