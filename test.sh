#/bin/bash
echo "---------- 443 --------------"
curl --insecure https://localhost:443
curl --insecure http://localhost:443
echo "---------- 443 --------------"

echo "---------- 8080 --------------"
curl --insecure https://localhost:8080
curl --insecure http://localhost:8080
echo "---------- 8080 --------------"

echo "----------8890 --------------"
curl --insecure https://localhost:8890
curl --insecure http://localhost:8890
echo "----------8890 --------------"

echo "---------- 9000 --------------"
curl --insecure https://localhost:9000
curl --insecure http://localhost:9000
echo "---------- 9000 --------------"


echo "---------- 80 --------------"
# curl --insecure https://localhost:80
# curl --insecure http://localhost:80
echo "---------- 80 --------------"

echo "---------- 3306 --------------"
curl --insecure https://localhost:3306
curl --insecure http://localhost:3306
echo "---------- 3306 --------------"
