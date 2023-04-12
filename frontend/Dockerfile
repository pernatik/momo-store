FROM gitlab.praktikum-services.ru:5050/std-011-065/momo-store/node:16.18.1-alpine as build
#ARG VUE_APP_API_URL=${VUE_APP_API_URL}
#ARG VUE_APP_API_URL=http://localhost:8081
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY ./ .
RUN npm run build


FROM gitlab.praktikum-services.ru:5050/std-011-065/momo-store/nginx:stable-alpine3.17
COPY --from=build /app/dist /app
COPY nginx.conf /etc/nginx/nginx.conf
COPY /ssl /etc/ssl/
#EXPOSE 8080
EXPOSE 443
EXPOSE 80