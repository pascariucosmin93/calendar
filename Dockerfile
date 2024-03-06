# Folosim imaginea oficială Nginx ca bază
FROM nginx:1.25.4

# Exponăm portul 80 pentru a putea accesa serverul web
EXPOSE 80

# Înainte de a copia fișierele, cream directorul în care vor fi montate fișierele din volum
RUN mkdir -p /usr/share/nginx/html

# Copiem fișierele HTML și CSS în directorul de lucru al serverului web Nginx
COPY index.html /usr/share/nginx/html/
COPY calendar.css /usr/share/nginx/html/
COPY calendar.js /usr/share/nginx/html/
COPY jquery-1.2.4.js /usr/share/nginx/html/

# Încheiem cu comanda pentru a porni serverul Nginx atunci când containerul este lansat
CMD ["nginx", "-g", "daemon off;"]
