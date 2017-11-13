FROM nginx:stable-alpine
RUN npm install
RUN npm start
COPY ./build/* /usr/share/nginx/html/