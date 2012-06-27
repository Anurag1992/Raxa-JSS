echo "// Autogenerated version (not guaranteed to be sequential): `git describe --abbrev=4 HEAD | sed -e "s/-/./g" | sed 's/^v\(.*\)/\1/'`" > smart-api-client.js
echo "// Autogenerated by concantenating several files: " >> smart-api-client.js
echo "// DO NOT EDIT. " >> smart-api-client.js
echo "// cat ../../jquery/jquery.js jquery-ui.js  jquery.rdfquery.core-1.0.js jschannel.js smart-api-client-base.js  > smart-api-client.js"  >> smart-api-client.js

export PYTHONPATH=.:../../../..
python build.py > smart-temp.js

echo "(function(window){" >> smart-api-client.js

cat jquery.min.js >> smart-api-client.js
echo "var $ = window.jQuery.noConflict(true), jQuery = $;" >> smart-api-client.js
cat jquery.rdfquery.core-1.0.js jschannel.js smart-temp.js  >> smart-api-client.js

echo "})(window);" >> smart-api-client.js

rm smart-temp.js