### IP geo data

define the variable $exclusions and list all IP address allowed
access by setting the value to "1"

```
http {
    geoip_country /usr/share/GeoIP/GeoIP.dat;

    geo $exclusions { 
        default 0;
        127.0.0.1 1;
    }
    ...

}

server {
    if ($geoip_country_code = "CN") {
        set $exclusions 1;
    }

    location / {
        if ($exclusions = "0"){
            return 403;
        }
        try_files $uri $uri/ @superlists;
    }
}
```