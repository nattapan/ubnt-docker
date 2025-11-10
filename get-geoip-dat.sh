wget -q -N -P /var/lib/Geoip https://dl.miyuru.lk/geoip/dbip/country/dbip4.dat.gz
cd /var/lib/Geoip
gzip -dkf dbip4.dat.gz 
