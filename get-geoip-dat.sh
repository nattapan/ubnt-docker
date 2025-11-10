wget -q -N -P /var/lib/GeoIP https://dl.miyuru.lk/geoip/dbip/country/dbip4.dat.gz
cd /var/lib/GeoIP
gzip -dkf dbip4.dat.gz 
