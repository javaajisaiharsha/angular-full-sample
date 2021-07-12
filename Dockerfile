FROM node:10-alpine
WORKDIR /app
COPY package.json .
RUN npm install -g @angular/cli && npm install
COPY . .
#RUN ng build
RUN npm run build --prod
 
FROM nginx
COPY --from=0 /app/dist /usr/share/nginx/html
EXPOSE 80
