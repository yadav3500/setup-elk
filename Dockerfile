wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo gpg --dearmor -o /usr/share/keyrings/elasticsearch-keyring.gpg
wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-8.3.0-amd64.deb
wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-8.3.0-amd64.deb.sha512
shasum -a 512 -c elasticsearch-8.3.0-amd64.deb.sha512
sudo dpkg -i elasticsearch-8.3.0-amd64.deb
sudo systemctl start elasticsearch.service
wget https://artifacts.elastic.co/downloads/kibana/kibana-8.3.0-amd64.deb
shasum -a 512 kibana-8.3.0-amd64.deb 
sudo dpkg -i kibana-8.3.0-amd64.deb
echo "server.port: 5601"  >> /etc/kibana/kibana.yml
echo "server.host: 0.0.0.0"  >> /etc/kibana/kibana.yml
sudo systemctl start kibana.service
sleep 30s
cd /usr/share/elasticsearch
sudo bin/elasticsearch-create-enrollment-token -s kibana
cd /usr/share/kibana
sudo bin/kibana-verification-code
